import Foundation
import Firebase

final class CreateAccountService {
    
  static func createAccount(with email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error)
                completion(.failure(error))
            }
            
            if let authResult = authResult {
                print(authResult)
                completion(.success(authResult))
            }
        }
    }
}
