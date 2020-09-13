import Foundation
import Firebase

final class LoginAccountService {
    
    static func loginAccount(with email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            if let authResult = authResult {
                print(authResult)
                completion(.success(authResult))
            }
        }
    }
}
