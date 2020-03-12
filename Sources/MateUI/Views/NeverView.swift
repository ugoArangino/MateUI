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

    public static func builder() -> Never { fatalError("This builder will never be called.") }

    public static func builderWithArgument(_: Never) -> Never {}
}
