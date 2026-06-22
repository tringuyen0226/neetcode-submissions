class Solution {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return false }

        let pairs: [Character: Character] = [
        "}": "{",
        "]": "[",
        ")": "("
    ]

    var stack = [Character]()
    stack.reserveCapacity(s.count)

    for char in s {
        if let expectedOpener = pairs[char] {
            guard stack.popLast() == expectedOpener else {
                return false
            }
        } else {
            stack.append(char)
        }
    }

    return stack.isEmpty

    }
}
