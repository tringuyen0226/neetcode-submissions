class MedianFinder {
    private var nums: [Int] = []

    init() {}
    func addNum(_ num: Int) {
       if nums.isEmpty {
        nums.append(num)
        return
       }

       var left: Int = 0
       var right: Int = nums.count - 1
       while left <= right {
        let mid = left + (right - left) / 2
        if nums[mid] < num {
            left = mid + 1 
        } else {
            right = mid - 1
        }
       }

       nums.insert(num, at: left)
    }

    func findMedian() -> Double {
       let count = nums.count
       guard count > 0 else { return 0 }
       let mid = count / 2
       if count % 2 == 0 {
        return Double(nums[mid - 1] + nums[mid]) / 2.0
       } else {
        return Double(nums[mid])
       }
    }
}
