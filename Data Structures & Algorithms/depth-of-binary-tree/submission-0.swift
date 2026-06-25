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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var queue: [TreeNode] = [root]
        var depth: Int = 0

        while !queue.isEmpty {
            let size: Int = queue.count
            for _ in 0..<size {
            let node: TreeNode = queue.removeFirst()
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
            }

            depth += 1
        }

        return depth
    }
}
