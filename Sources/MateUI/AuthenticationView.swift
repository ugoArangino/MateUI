import SwiftUI

public struct AuthenticationView: UIViewControllerRepresentable {

    public typealias Complection = AuthenticationViewController.Complection

    private let authenticationURL: URL
    private let callbackURLScheme: String
    private let complection: Complection

    public init(authenticationURL: URL, callbackURLScheme: String, complection: @escaping Complection) {
        self.authenticationURL = authenticationURL
        self.callbackURLScheme = callbackURLScheme
        self.complection = complection
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<Self>)
        -> AuthenticationViewController
    {
        .init(authenticationURL: authenticationURL, callbackURLScheme: callbackURLScheme, complection: complection)
    }

    public func updateUIViewController(
        _ uiViewController: AuthenticationViewController, context: UIViewControllerRepresentableContext<Self>
    ) {}
}
