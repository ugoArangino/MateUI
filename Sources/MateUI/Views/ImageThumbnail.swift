import SwiftUI

public struct ImageThumbnail: View {
    @Environment(\.cornerRadius) private var cornerRadius: CGFloat

    private let image: Image?
    private let placeholderImage: Image?

    public init(image: Image? = nil,
                placeholderImage: Image? = nil) {
        self.image = image
        self.placeholderImage = placeholderImage
    }

    public var body: some View {
        Group {
            if image != nil {
                image!
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
            } else {
                ZStack {
                    Color.primary
                    placeholderImage
                        .foregroundColor(.primary)
                        .colorInvert()
                        .font(.title)
                }
            }
        }
        .frame(width: 100, height: 100, alignment: .center)
        .scaledToFit()
        .cornerRadius(cornerRadius)
        .clipped()
    }
}

#if DEBUG
    struct ItemThumbnail_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ImageThumbnail(
                    image: Image("demoImage"),
                    placeholderImage: Image(systemName: "doc")
                )

                ImageThumbnail(image: Image("demoImage"))

                ImageThumbnail(placeholderImage: Image(systemName: "doc"))

                ImageThumbnail()
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
#endif
