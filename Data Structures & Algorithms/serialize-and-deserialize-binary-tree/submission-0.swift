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

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var result: [String] = []

        func dfs(_ node: TreeNode?) {
            guard let node else {
                result.append("N")
                return
            }
            result.append(String(node.val))

            dfs(node.left)
            dfs(node.right)
        }

        dfs(root)

        return result.joined(separator: ",")
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        let values  = data.split(separator: ",").map(String.init)

        var index = 0

        func build() -> TreeNode? {
            guard index < values.count else { return nil }
            
            let token = values[index]
            index += 1

            if token == "N" { return nil }
            guard let val = Int(token) else { return nil }

            let node = TreeNode(val)
            node.left = build()
            node.right = build()

            return node
        }

        return build()
    }
}
