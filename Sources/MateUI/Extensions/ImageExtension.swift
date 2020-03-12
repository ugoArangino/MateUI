import SwiftUI

public extension Image {
    init?(data: Data) {
        guard let uiImage = UIImage(data: data) else {
            return nil
        }
        self.init(uiImage: uiImage)
    }

    func growning(height: CGFloat? = 300) -> some View {
        GeometryReader { (geometry: GeometryProxy) in
            if geometry.frame(in: .global).minY <= 0 {
                self
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
            } else {
                self
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -geometry.frame(in: .global).minY)
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                            + geometry.frame(in: .global).minY
                    )
            }
        }
        .background(Color.red)
        .frame(maxHeight: height)
    }
}
