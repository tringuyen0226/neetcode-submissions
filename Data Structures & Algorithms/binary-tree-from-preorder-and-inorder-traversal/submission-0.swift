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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderIndex = [Int: Int]()
        for (i, value) in inorder.enumerated() {
            inorderIndex[value] = i
        }

        var preIndex: Int = 0
        return helper(preorder, &preIndex, 0, inorder.count - 1, inorderIndex)
    }

    private func helper(
        _ preorder: [Int],
        _ preIndex: inout Int,
        _ left: Int,
        _ right: Int,
        _ inorderIndex: [Int: Int]
    ) -> TreeNode? {
        guard left <= right, preIndex < preorder.count else { return nil }

        let rootVal: Int = preorder[preIndex]
        preIndex += 1
        let node = TreeNode(rootVal)

        guard let mid = inorderIndex[rootVal] else { return node }
        node.left = helper(preorder, &preIndex, left, mid - 1, inorderIndex)
        node.right = helper(preorder, &preIndex, mid + 1, right, inorderIndex)
        return node
    }

}
