import UIKit
import Firebase
import GoogleSignIn

final class UserLoginViewController: UIViewController {
  
    // MARK: - Attributes
    private let userLoginView: UserLoginView
    
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
        
        userLoginView.didTapEnterButton = { [weak self] email, password in
            guard let self = self else { return }
            self.login(with: email, password: password)
        }
        
        userLoginView.didTapEnterWithGoogleButton = {
            
        }
        
        userLoginView.didTapEnterWithFacebookButton = {
            
        }
        
        userLoginView.didTapCreateAccountButton = {
            
        }
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
    }
}

// MARK: - Actions
extension UserLoginViewController {
    private func login(with email: String, password: String) {
        LoginAccountService.loginAccount(with: email, password: password) { (result) in
            switch result {
            case .success(let result):
                self.showAlert()
                print(result.credential.debugDescription)
            case .failure(let error):
                self.showAlert()
                print(error.localizedDescription)
            }
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Teste", message: "Teste", preferredStyle: .alert)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
}
