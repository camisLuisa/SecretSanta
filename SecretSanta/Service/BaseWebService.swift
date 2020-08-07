import Foundation
import Alamofire

class BaseWebService {
    
    func request(url: URL) {
        AF.request(url, method: .get).responseJSON { response in
            print(response)
        }
    }
}
