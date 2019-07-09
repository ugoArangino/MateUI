import SwiftUI

public extension Binding {
    func map<V>(
        get: @escaping (Value) -> V,
        set: @escaping (V) -> Value
    ) -> Binding<V> {
        .init(getValue: { () -> V in
            get(self.value)
        }) { newValue in
            self.value = set(newValue)
        }
    }

    func argumented(didChange: @escaping () -> Void) -> Binding {
        .init(getValue: { () -> Value in
            self.value
        }) { newValue in
            self.value = newValue
            didChange()
        }
    }
}

public extension Binding where Value == String? {
    func some(_ default: String = "") -> Binding<String> {
        .init(getValue: { () -> String in
            self.value ?? `default`
        }) { newValue in
            if newValue == `default` {
                self.value = nil
            } else {
                self.value = newValue
            }
        }
    }
}
