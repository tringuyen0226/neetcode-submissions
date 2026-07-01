/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min

        @discardableResult
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }

            let leftGain = max(dfs(node.left), 0)
            let rightGain = max(dfs(node.right), 0)

            let priceNewPath = node.val + leftGain + rightGain
            maxSum = max(maxSum, priceNewPath)

            return node.val + max(leftGain, rightGain)
        }

        dfs(root)

        return maxSum
    }
}
