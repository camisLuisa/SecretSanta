import Foundation

enum FieldError: Error {
    case empty
    case incomplete
    case tooShort
    case tooLong
    case invalid(InvalidFieldReason)
}

enum InvalidFieldReason {
    case wrongFormat
    case experiedDate
    case `default`
}

extension FieldError: Equatable {
    static func == (lhs: FieldError, rhs: FieldError) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.incomplete, .incomplete):
            return true
        case (.tooShort, .tooShort):
            return true
        case (.tooLong, .tooLong):
            return true
        case (.invalid(let lhsReason), .invalid(let rhsReason)):
            if lhsReason == rhsReason {
                return true
            }
            return false
        default:
            return false
        }
    }
}
