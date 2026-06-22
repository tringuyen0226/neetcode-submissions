class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        var count = [Character: Int]()
        var left = 0
        var maxFreq = 0
        var maxLength = 0

        for right in 0..<chars.count {
            count[chars[right], default: 0] += 1
            maxFreq = max(maxFreq, count[chars[right]]!)

            let windowSize = right - left + 1

            if windowSize - maxFreq > k {
                count[chars[left]]! -= 1
                left += 1
            }

            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}
