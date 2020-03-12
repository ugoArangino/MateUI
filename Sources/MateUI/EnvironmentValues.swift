import SwiftUI

private struct CornerRadiusEnvironmentKey: EnvironmentKey {
    static var defaultValue: CGFloat = 8
}

public extension EnvironmentValues {
    var cornerRadius: CGFloat {
        get { self[CornerRadiusEnvironmentKey.self] }
        set { self[CornerRadiusEnvironmentKey.self] = newValue }
    }
}
