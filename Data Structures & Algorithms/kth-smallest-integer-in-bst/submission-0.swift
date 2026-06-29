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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var current = root
        var count = 0 // Biến đếm số phần tử đã duyệt qua
        
        while current != nil || !stack.isEmpty {
            while let node = current {
                stack.append(node)
                current = node.left
            }
            
            current = stack.removeLast()
            count += 1
            
            // Nếu đếm bằng k, đây chính là phần tử nhỏ thứ k cần tìm
            if count == k {
                return current!.val
            }
            
            current = current?.right
        }
        
        return -1 // Trường hợp không tìm thấy (theo đề bài k luôn hợp lệ)
    }
}