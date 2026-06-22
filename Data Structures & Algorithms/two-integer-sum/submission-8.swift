class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numToIndex = [Int: Int]()

        for (index, value) in nums.enumerated() {
            let complement = target - value
            if let complementIndex = numToIndex[complement] {
                return [complementIndex, index]
            } 
            numToIndex[value] = index
        }

        return []
    }
}
