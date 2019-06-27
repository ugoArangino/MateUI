import SwiftUI
import UIKit

private struct _TextView: UIViewRepresentable {
    @Binding private var text: String

    init(_ text: Binding<String>) {
        $text = text
    }

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.textContainerInset = .zero
        view.textContainer.lineFragmentPadding = 0
        view.font = UIFont.preferredFont(forTextStyle: .body)
        return view
    }

    func updateUIView(_ uiView: UITextView, context _: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> _TextView.Coordinator {
        Coordinator($text)
    }

    // MARK: Coordinator

    class Coordinator: NSObject, UITextViewDelegate {
        @Binding private var text: String

        init(_ text: Binding<String>) {
            $text = text
        }

        func textViewDidChangeSelection(_ textView: UITextView) {
            text = textView.text
        }
    }
}

public struct TextView: View {
    @Binding private var text: String
    private let placeholder: Text?

    public init(_ text: Binding<String>, placeholder: Text? = nil) {
        $text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            _TextView($text)
            if text.isEmpty {
                placeholder?
                    .color(.gray)
            }
        }
        .background(text.isEmpty ? Color.red : Color.blue)
    }
}
