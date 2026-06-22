class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var seen = Set<Character>()
        var maxLength = 0
        var left = 0

        for right in 0..<chars.count {
            while seen.contains(chars[right]) {
                seen.remove(chars[left])
                left += 1
            }
            seen.insert(chars[right])
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}
