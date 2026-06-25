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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil { return true }
        guard let root else { return false }

        if isSameTree(root, subRoot) { return true } 

        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }

    private func isSameTree(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        if a == nil && b == nil { return true }
        guard let a, let b else { return false }
        
        return a.val == b.val && isSameTree(a.left, b.left) && isSameTree(a.right, b.right)
    }
}
