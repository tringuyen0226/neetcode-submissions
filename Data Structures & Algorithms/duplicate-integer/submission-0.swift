class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        let setOfNums = Set(nums)

        return !(setOfNums.count == nums.count)
    }
}
