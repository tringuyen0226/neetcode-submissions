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
    func isValidBST(_ root: TreeNode?) -> Bool {
        validate(root, minLimit: Int.min, maxLimit: Int.max)
    }

    private func validate(_ node: TreeNode?, minLimit: Int, maxLimit: Int) -> Bool {
        guard let node else {
            return true
        }

        if node.val <= minLimit || node.val >= maxLimit {
            return false
        }

        return validate(node.left, minLimit: minLimit, maxLimit: node.val) 
        && validate(node.right, minLimit: node.val, maxLimit: maxLimit)
    }
}
