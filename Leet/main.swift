//
//  main.swift
//  Leet
//
//  Created by Dayson Dong on 2021-11-09.
//

import Foundation


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        var chars: Set<String.Element> = []
        
        var max = 0
        
        for char in s {
            if chars.contains(char) {
                max = chars.count > max ? chars.count : max;
                chars.removeAll()
            }
            chars.insert(char)
        }
        
        return max
    }
}

