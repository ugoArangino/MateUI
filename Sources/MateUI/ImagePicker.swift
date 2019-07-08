import SwiftUI

public struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isShown: Bool
    @Binding var image: UIImage?

    public init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
        $isShown = isShown
        $image = image
    }

    public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var isShown: Bool
        @Binding var image: UIImage?

        init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
            $isShown = isShown
            $image = image
        }

        public func imagePickerController(
            _: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            isShown = false
        }

        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            isShown = false
        }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
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
