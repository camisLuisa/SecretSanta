import UIKit

final class CreateUserLoginViewController: UIViewController {
    
    //MARK: - Attributes
    private let createUserLoginView: CreateUserLoginView
    
    // MARK: - init
    init() {
        self.createUserLoginView = CreateUserLoginView()
        super.init(nibName: nil, bundle: nil)
    }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        view = createUserLoginView
        super.viewDidLoad()
        
        createUserLoginView.didTapEnterButton = { username, email, password in
            CreateAccountService.createAccount(with: email, password: password) { result in
                switch result {
                case .success(let result):
                    print(result.credential.debugDescription)
                    self.navigationController?.popViewController(animated: true)
                case .failure(let error):
                    print(error.localizedDescription)
                    self.showAlert()
                }
            }
            
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ops!", message: "Algum problema aconteceu.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
}
