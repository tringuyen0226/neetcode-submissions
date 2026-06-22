class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let set = Set(nums)
        var longest = 0

        for num in set where !set.contains(num - 1) {
            var current = num
            var length = 1
            while set.contains(current + 1) {
                current += 1
                length += 1
            }
            longest = max(longest, length)
        }

        return longest
    }
}
