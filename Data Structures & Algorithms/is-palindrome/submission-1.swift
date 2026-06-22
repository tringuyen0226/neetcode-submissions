class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var s = s.filter { $0.isLetter || $0.isNumber }
        let lowercasedS = s.lowercased()
        return lowercasedS == String(lowercasedS.reversed())
    }
}
