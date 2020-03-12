import SwiftUI

public extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

extension AnyView {
    static var empty: AnyView {
        EmptyView().eraseToAnyView()
    }
}
