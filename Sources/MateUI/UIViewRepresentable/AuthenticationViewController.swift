import AuthenticationServices
import UIKit

public class AuthenticationViewController: UIViewController {
    public typealias Complection = (Result<String, Error>) -> Void

    private var session: ASWebAuthenticationSession?
    private let authenticationURL: URL
    private let callbackURLScheme: String
    private let complection: Complection

    public init(authenticationURL: URL, callbackURLScheme: String, complection: @escaping Complection) {
        self.authenticationURL = authenticationURL
        self.callbackURLScheme = callbackURLScheme
        self.complection = complection
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        let session = ASWebAuthenticationSession(url: authenticationURL, callbackURLScheme: callbackURLScheme)
        { [weak self] callbackURL, error in
            guard let self = self else { return }
            guard error == nil, let callbackURL = callbackURL else {
                self.complection(.failure(error!))
                return
            }

            let queryItems = URLComponents(string: callbackURL.absoluteString)?.queryItems
            let code = queryItems?.filter { $0.name == "code" }.first?.value
            self.complection(.success(code!))
        }

        session.presentationContextProvider = self

        session.start()

        self.session = session
    }
}

extension AuthenticationViewController: ASWebAuthenticationPresentationContextProviding {
    public func presentationAnchor(for _: ASWebAuthenticationSession) -> ASPresentationAnchor {
        .init()
    }
}
