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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0)

        dummy.next = head

        var fast: ListNode? = head
        
        for _ in 0..<n {
            fast = fast?.next
        }

        var slow: ListNode? = dummy

        while fast != nil {
            slow = slow?.next
            fast = fast?.next
        }

        slow?.next = slow?.next?.next

        return dummy.next
    }
}
