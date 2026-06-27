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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }

        var result: [[Int]] = []
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            var nodeVals: [Int] = []
            
            for _ in 0..<queue.count {
                let node = queue.removeFirst()

                nodeVals.append(node.val)

                if let left = node.left {
                    queue.append(left)
                } 
                if let right = node.right {
                    queue.append(right)
                }
            }

            result.append(nodeVals)
        }

        return result
    }
}
