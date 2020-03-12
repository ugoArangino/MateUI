import SwiftUI

extension Font.TextStyle: Identifiable {
    public var id: Int {
        return hashValue
    }
}

public struct TextStylesView: View {
    private let all: [Font.TextStyle] = [
        .largeTitle,
        .title,
        .headline,
        .subheadline,
        .body,
        .callout,
        .footnote,
        .caption,
    ]

    public init() {}

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(all) { style in
                Text(String(describing: style))
                    .font(.system(style))
            }
        }
    }
}
