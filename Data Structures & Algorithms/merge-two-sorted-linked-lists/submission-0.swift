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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)

        var curr: ListNode? = dummy

        var list1 = list1
        var list2 = list2

        while let l1 = list1, let l2 = list2 {
            if l1.val <= l2.val {
                curr?.next = l1
                list1 = list1?.next
            } else {
                curr?.next = l2
                list2 = list2?.next
            }
            curr = curr?.next
        }

        curr?.next = list1 ?? list2

        return dummy.next
    }
}
