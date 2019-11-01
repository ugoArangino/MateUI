import SwiftUI
import UIKit

private struct _TextView: UIViewRepresentable {
    private var text: Binding<String>

    init(_ text: Binding<String>) {
        self.text = text
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
        uiView.text = text.wrappedValue
    }

    func makeCoordinator() -> _TextView.Coordinator {
        Coordinator(text)
    }

    // MARK: Coordinator

    class Coordinator: NSObject, UITextViewDelegate {
        private var text: Binding<String>

        init(_ text: Binding<String>) {
            self.text = text
        }

        func textViewDidChangeSelection(_ textView: UITextView) {
            text.wrappedValue = textView.text
        }
    }
}

public struct TextView: View {
    private var text: Binding<String>
    private let placeholder: Text?

    public init(_ text: Binding<String>, placeholder: Text? = nil) {
        self.text = text
        self.placeholder = placeholder
    }

    public var body: some View {
        ZStack(alignment: Alignment.topLeading) {
            _TextView(text)
            if text.wrappedValue.isEmpty {
                placeholder?
                    .foregroundColor(.gray)
            }
        }
            .background(text.wrappedValue.isEmpty ? Color.red : Color.blue)
    }
}
