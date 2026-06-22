class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var index = 0
        var result = [Int]()
        for i in 0..<nums.count {
            var products = nums
            products.remove(at: i)
            let productsValue = products.reduce(1, *)
            result.append(productsValue)
        }
        return result
    }
}
