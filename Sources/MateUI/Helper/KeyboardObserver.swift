
import Combine
import UIKit

public final class KeyboardObserver: ObservableObject {
    @Published public private(set) var keyboardFrame: CGRect?

    private var notificationCenter: NotificationCenter
    private var cancellableBag = Set<AnyCancellable>()

    public init(center: NotificationCenter = .default) {
        notificationCenter = center

        let showPublisher = NotificationCenter.Publisher(
            center: .default,
            name: UIResponder.keyboardWillShowNotification
        )
        .map { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect }
        .assign(to: \.keyboardFrame, on: self)
        let hidePublisher = NotificationCenter.Publisher(
            center: .default,
            name: UIResponder.keyboardWillHideNotification
        )
        .map { _ in CGRect?.none }
        .assign(to: \.keyboardFrame, on: self)

        cancellableBag.insert(showPublisher)
        cancellableBag.insert(hidePublisher)
    }
}
