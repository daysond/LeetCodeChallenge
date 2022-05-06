//
//  main.swift
//  Leet
//
//  Created by Dayson Dong on 2021-11-09.
//

import Foundation

//
//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    //    "aabaab!bb"
//
//        let chars: NSMutableOrderedSet = []
//        var max = 0
//
//        for c in s {
//
//            if chars.contains(c) {
//
//                chars.removeObjects(in: NSMakeRange(0, chars.index(of: c)+1))
//
//            }
//
//            chars.add(c)
//
//            if chars.count > max {
//                max = chars.count
//            }
//        }
//
//        return max
//    }
//}

/*
 
 Runtime: 1507 ms, faster than 5.04% of Swift online submissions for Longest Substring Without Repeating Characters.
 Memory Usage: 14.9 MB, less than 29.67% of Swift online submissions for Longest Substring Without Repeating Characters.
 
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

    //    "nfpdmpi"

        var chars = [String.Element: Int]()
        var max = 0
        var current = 0
        for c in s {

            let keyNotExists = chars[c] == nil

            if keyNotExists {
                chars[c] = current
                current += 1
                max = chars.count > max ? chars.count : max
            } else {
                max = chars.count > max ? chars.count : max
                let position = chars[c]

                for (key, value) in chars {
                    if value <= position! {
                        chars.removeValue(forKey: key)
                    }
                }
                chars[c] = current
                current += 1

            }

        }

        return max
    }
}

/*
 
 Runtime: 77 ms, faster than 20.90% of Swift online submissions for Longest Substring Without Repeating Characters.
 Memory Usage: 14.5 MB, less than 68.83% of Swift online submissions for Longest Substring Without Repeating Characters.

 
 */
