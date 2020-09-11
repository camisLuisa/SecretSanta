import UIKit

final class CreateUserLoginViewController: UIViewController {
    
    //MARK: - Attibutes
    private let createUserLoginView: CreateUserLoginView
    
    //MARK: - init
    init() {
        self.createUserLoginView = CreateUserLoginView()
        super.init(nibName: nil, bundle: nil)
    }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle -
    override func viewDidLoad() {
        view = createUserLoginView
        super.viewDidLoad()
        
        createUserLoginView.didTapEnterButton = { username, email, password in
            CreateAccountService.createAccount(with: email, password: password) { result in
                switch result {
                case .success(let result):
                    print(result.credential.debugDescription)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    private func showAlert(msg: String) {
//        let alert = UIAlertController(title: "", message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
    }
}
