import UIKit

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
        
        userLoginView.didTapEnterButton = { email, password in
            LoginAccountService.loginAccount(with: email, password: password) { (result) in
                switch result {
                case .success(let result):
                    print(result.credential.debugDescription)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
