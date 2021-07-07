import Foundation

extension String {
    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isEmpty: Bool {
        return trim() == ""
    }
    
    func toAlphanumeric() -> String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
        return self.filter { okayChars.contains($0) }
    }
}
