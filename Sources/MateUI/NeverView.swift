import SwiftUI

public struct NeverView: View {
    private let message: String

    public init(message: String = "This view will never appear.") {
        self.message = message
    }

    public var body: Never {
        fatalError(message)
    }

    public static func render(_: Void) -> NeverView {
        return NeverView()
    }
}
