import UIKit
import Firebase
import GoogleSignIn

final class UserLoginViewController: UIViewController {

    // MARK: - Attributes
    private let userLoginView: UserLoginView
    private var spinnerVC: SpinnerViewController?
    weak var coordinator: MainCoordinator?

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
        GIDSignIn.sharedInstance().delegate = self
        
        userLoginView.didTapEnterButton = { [weak self] email, password in
            guard let self = self else { return }
            self.createSpinnerView()
            self.login(with: email, password: password)
        }
        
        userLoginView.didTapEnterWithGoogleButton = { [weak self] in
            guard let self = self else { return }
            GIDSignIn.sharedInstance().signIn()
            self.createSpinnerView()
        }
        
        userLoginView.didTapEnterWithFacebookButton = {
            // To Do
        }
        
        userLoginView.didTapCreateAccountButton = {
            self.coordinator?.GoToCreateAccount()
        }
    }
}

// MARK: - Actions
extension UserLoginViewController {
    private func login(with email: String, password: String) {
        LoginAccountService.loginAccount(with: email, password: password) { [weak self] result in
            guard let self = self, let spinnerVC = self.spinnerVC else { return }
            spinnerVC.stopLoading()
            
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
    
    func createSpinnerView() {
        spinnerVC = SpinnerViewController()
        
        guard let spinnerVC = self.spinnerVC else { return }

        // add the spinner view controller
        addChild(spinnerVC)
        spinnerVC.view.frame = view.frame
        view.addSubview(spinnerVC.view)
        spinnerVC.view.translatesAutoresizingMaskIntoConstraints = false
        spinnerVC.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinnerVC.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        spinnerVC.didMove(toParent: self)
    }
}

// MARK: - GoogleSignIn
extension UserLoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            guard let spinnerVC = self.spinnerVC else { return }
            spinnerVC.stopLoading()

            print(error.localizedDescription)
            return
        }

        guard let auth = user.authentication else { return }

        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { [weak self] (_, error) in
            guard let self = self, let spinnerVC = self.spinnerVC else { return }

            spinnerVC.stopLoading()

            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful.")
                self.coordinator?.runCreateGroupFlow()
            }
        }
    }
}
