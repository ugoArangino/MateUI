import SwiftUI

public struct SearchBar: UIViewRepresentable {
    public let text: Binding<String>

    public init(text: Binding<String>) {
        self.text = text
    }

    public class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        public func searchBar(_: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    public func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: text)
    }

    public func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }

    public func updateUIView(_ uiView: UISearchBar, context _: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text.wrappedValue
    }
}
