import SwiftUI

public extension View {
    func modal() -> Modal {
        return Modal(self)
    }
}
