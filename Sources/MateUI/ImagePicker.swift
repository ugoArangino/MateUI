import SwiftUI

public struct ImagePicker: UIViewControllerRepresentable {
    var isShown: Binding<Bool>
    var image: Binding<UIImage?>

    public init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
        self.isShown = isShown
        self.image = image
    }

    public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var isShown: Binding<Bool>
        var image: Binding<UIImage?>

        init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
            self.isShown = isShown
            self.image = image
        }

        public func imagePickerController(
            _: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            image.wrappedValue = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            isShown.wrappedValue = false
        }

        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            image.wrappedValue = nil
            isShown.wrappedValue = false
        }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: isShown, image: image)
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .savedPhotosAlbum
        return picker
    }

    public func updateUIViewController(
        _: UIImagePickerController,
        context _: UIViewControllerRepresentableContext<ImagePicker>
    ) {}
}
