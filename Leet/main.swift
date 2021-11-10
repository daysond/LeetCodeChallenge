//
//  main.swift
//  Leet
//
//  Created by Dayson Dong on 2021-11-09.
//

import Foundation


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        } else if l1 == nil && l2 != nil {
            return l2
        } else if l1 != nil && l2 == nil {
            return l1
        } else {
            
            let newVal = l1!.val + l2!.val
            
            if newVal <= 9 {
                
                return ListNode(newVal, addTwoNumbers(l1?.next, l2?.next))
                
            } else {
                let newNode = l1?.next
                if newNode == nil {
                    return ListNode(newVal - 10, addTwoNumbers(ListNode(1), l2?.next))
                } else {
                    newNode?.val = newNode!.val + 1
                    
                    return ListNode(newVal - 10,addTwoNumbers(newNode, (l2?.next == nil && newNode!.val > 9 ) ? ListNode(0) : l2?.next))
                }
            }
        }
    }
}
/*
 Runtime: 36 ms, faster than 97.26% of Swift online submissions for Add Two Numbers.
 Memory Usage: 14.1 MB, less than 9.92% of Swift online submissions for Add Two Numbers.
*/
