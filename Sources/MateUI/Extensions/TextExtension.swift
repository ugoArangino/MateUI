import SwiftUI

public extension Text {
    init?<S>(maybe content: S?) where S: StringProtocol {
        guard let content = content else {
            return nil
        }

        self.init(content)
    }

    static func maybe<S>(_ content: S?) -> AnyView where S: StringProtocol {
        return Text(maybe: content)?.eraseToAnyView() ?? EmptyView().eraseToAnyView()
    }
}
