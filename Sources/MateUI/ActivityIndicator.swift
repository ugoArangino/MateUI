import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style

    public init(style: UIActivityIndicatorView.Style = .medium) {
        self.style = style
    }

    public func makeUIView(context _: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context _: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

#if DEBUG
    struct ActivityIndicator_Previews: PreviewProvider {
        static var previews: some View {
            ActivityIndicator(style: .large)
        }
    }
#endif
