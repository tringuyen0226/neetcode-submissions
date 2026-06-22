class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || s.count < t.count { return "" }

        var need: [Character: Int] = [:]
        for char in t {
            need[char, default: 0] += 1
        }
        let requiredCount = need.count

        let chars: [Character] = Array(s)

        var left: Int = 0
        var window: [Character: Int] = [:]
        var have: Int = 0
        var bestLeft: Int = 0
        var bestLen: Int = Int.max

        for right in 0..<chars.count {
            let c = chars[right]
            if need[c] != nil {
                window[c, default: 0] += 1
                if window[c] == need[c] {
                    have += 1
                }
            }

            while have == requiredCount {
                let windowSize = right - left + 1
                if windowSize < bestLen {
                    bestLen = windowSize
                    bestLeft = left
                }
                
                let lc = chars[left]
                if need[lc] != nil {
                    window[lc]! -= 1
                    if window[lc]! < need[lc]! {
                        have -= 1
                    }
                }
                left += 1
            }
        }

        return bestLen == Int.max ? "" : String(chars[bestLeft..<(bestLeft + bestLen)])
    }
}
