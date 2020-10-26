import UIKit
import Firebase
import GoogleSignIn

final class UserLoginViewController: UIViewController {

    // MARK: - Attributes
    private let userLoginView: UserLoginView
    weak var coordinator: SplashCoordinator?
    
    // MARK: - init
    init() {
        self.userLoginView = UserLoginView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        view = userLoginView
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        userLoginView.didTapEnterButton = { [weak self] email, password in
            guard let self = self else { return }
            self.login(with: email, password: password)
        }
        
        userLoginView.didTapEnterWithGoogleButton = {
            GIDSignIn.sharedInstance().signIn()
        }
        
        userLoginView.didTapEnterWithFacebookButton = {
            
        }
        
        userLoginView.didTapCreateAccountButton = {
            
        }
    }
}

// MARK: - Actions
extension UserLoginViewController {
    private func login(with email: String, password: String) {
        LoginAccountService.loginAccount(with: email, password: password) { (result) in
            switch result {
            case .success(let result):
                print(result.credential.debugDescription)
                self.coordinator?.runCreateGroupFlow()
            case .failure(let error):
                self.showAlert()
                print(error.localizedDescription)
            }
        }
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Ops!", message: "Algum problema aconteceu", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
}

extension UserLoginViewController {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
       print("Google Sing In didSignInForUser")
       if let error = error {
         print(error.localizedDescription)
         return
       }
       guard let authentication = user.authentication else { return }
       let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
   // When user is signed in
       Auth.auth().signIn(with: credential, completion: { (user, error) in
         if let error = error {
           print("Login error: \(error.localizedDescription)")
           return
         }
       })
     }

     // Start Google OAuth2 Authentication
     func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {

       // Showing OAuth2 authentication window
       if let aController = viewController {
         present(aController, animated: true) {() -> Void in }
       }
     }

     // After Google OAuth2 authentication
     func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
       // Close OAuth2 authentication window
       dismiss(animated: true) {() -> Void in }
     }
}
