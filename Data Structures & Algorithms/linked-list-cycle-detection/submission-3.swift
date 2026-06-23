/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next // 1 step
            fast = fast?.next?.next // 2 steps
            if slow === fast {
                return true
            }
        }

        return false
    }
}
