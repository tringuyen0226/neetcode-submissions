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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }

        var lists = lists
        var interval = 1
        
        while interval < lists.count {
            for i in stride(from: 0, to: lists.count - interval, by: interval * 2) {
                lists[i] = mergeTwo(lists[i], lists[i + interval])
            }
            interval *= 2
        }

        return lists[0]
    }

    private func mergeTwo(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        
        var current: ListNode? = dummy

        var a: ListNode? = a
        var b: ListNode? = b

        while let la = a, let lb = b {
            if la.val <= lb.val {
                current?.next = la
                a = a?.next
            } else {
                current?.next = lb
                b = b?.next
            }
            current = current?.next
        }

        current?.next = a ?? b

        return dummy.next
    }

}
