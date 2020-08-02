import Foundation
import Alamofire

class BaseWebService {
    
    func request(url: URL, parameters: Parameters) {
        AF.request(url, method: .post, parameters: parameters, headers: nil).responseJSON { response in
            
        }
    }
}
