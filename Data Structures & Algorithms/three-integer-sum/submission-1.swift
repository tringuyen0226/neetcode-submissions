class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let sorted = nums.sorted()
        let n = nums.count

        for i in 0..<n {
            if i > 0 && sorted[i] == sorted[i - 1] {
                continue
            }

            if sorted[i] > 0 {
                break
            }

            var left = i + 1
            var right = n - 1

            while left < right {
                let sum = sorted[left] + sorted[i] + sorted[right]
                if sum == 0 {
                    result.append([sorted[i], sorted[left], sorted[right]])

                    while left < right && sorted[left] == sorted[left + 1] {
                        left += 1
                    }
                    while left < right && sorted[right] == sorted[right - 1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }

        }

        return result
    }
}
