import SwiftUI

public struct TagView: View {
    @Environment(\.font) private var font: Font?
    @Environment(\.cornerRadius) private var cornerRadius: CGFloat

    private let value: String?
    private let icon: Image?

    public init(
        _ value: String? = nil,
        icon: Image? = nil
    ) {
        self.value = value
        self.icon = icon
    }

    public var body: some View {
        Group {
            if value != nil || icon != nil {
                Group {
                    HStack(spacing: 4) {
                        icon
                        Text(maybe: value)?
                            .bold()
                            .lineLimit(1)
                    }
                }
                .font(font ?? .body)
                .foregroundColor(.white)
                .padding(.vertical, value != nil ? 4 : 8)
                .padding(.horizontal, 8)
                .background(Color.accentColor)
                .cornerRadius(cornerRadius)
            } else {
                EmptyView()
            }
        }
    }
}

#if DEBUG
    struct TagView_Previews: PreviewProvider {
        static var previews: some View {
            HStack {
                TagView(
                    "1",
                    icon: Image(systemName: "number.circle.fill")
                )
                .accentColor(.orange)
                TagView(
                    "test"
                )
                TagView(
                    icon: Image(systemName: "archivebox.fill")
                )
                TagView()
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
#endif
