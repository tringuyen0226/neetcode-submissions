class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorted: [Int] = nums.sorted()
        var result: [[Int]] = []
        var path: [Int] = []

        func dfs(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(path)
                return
            }

            for i in start..<sorted.count {
                let value: Int = sorted[i]
                if value > remaining { break }

                path.append(sorted[i])
                dfs(i, remaining - value)
                path.removeLast()
            }
        }

        dfs(0, target)

        return result
    }
}
