class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var minPrice = Int.max

        for price in prices {
            minPrice = min(price, minPrice)
            maxProfit = max(maxProfit, price - minPrice)
        }

        return maxProfit
    }
}
