import SwiftUI

public extension Binding {
    func map<V>(
        get: @escaping (Value) -> V,
        set: @escaping (V) -> Value
    ) -> Binding<V> {
        .init(get: { () -> V in
            get(self.wrappedValue)
        }) { newValue in
            self.wrappedValue = set(newValue)
        }
    }

    func argumented(didChange: @escaping () -> Void) -> Binding {
        .init(get: { () -> Value in
            self.wrappedValue
        }) { newValue in
            self.wrappedValue = newValue
            didChange()
        }
    }
}

public extension Binding where Value == String? {
    func some(_ default: String = "") -> Binding<String> {
        .init(get: { () -> String in
            self.wrappedValue ?? `default`
        }) { newValue in
            if newValue == `default` {
                self.wrappedValue = nil
            } else {
                self.wrappedValue = newValue
            }
        }
    }
}
