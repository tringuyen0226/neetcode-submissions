class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty else { return [] }

        var dict: [Int: Int] = [:]

        for num in nums {
            if var value = dict[num] {
                value += 1
                dict[num] = value
            } else {
                dict[num] = 1
            }
        }

        let sortedByValueDesc = dict.sorted { $0.value > $1.value }

        return sortedByValueDesc.dropLast(sortedByValueDesc.count - k).map { $0.key }
    }
}
