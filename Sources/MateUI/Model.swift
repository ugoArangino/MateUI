import SwiftUI

public extension View {
    func modal(onDismiss: (() -> Void)? = nil) -> Modal {
        return Modal(self, onDismiss: onDismiss)
    }
}
