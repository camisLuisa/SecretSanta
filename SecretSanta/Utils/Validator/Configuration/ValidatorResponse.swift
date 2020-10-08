import Foundation

typealias ValidatorResponse = Result<Void, FieldError>

extension ValidatorResponse {
    static func == (lhs: ValidatorResponse, rhs: ValidatorResponse) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (.failure(let lhsError), .failure(let rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
}
