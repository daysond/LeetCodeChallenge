//
//  main.swift
//  Leet
//
//  Created by Dayson Dong on 2021-11-09.
//

import Foundation


func twoSumA(_ nums: [Int], _ target: Int) -> [Int] {
    
    for (index, lhs) in nums.enumerated() {
        
        for n in index+1...nums.count-1 {
            if lhs + nums[n] == target {
                return [index, n]
            }
        }
    }
    return [0,0]
}


/*
 Runtime: 72 ms, faster than 51.84% of Swift online submissions for Two Sum.
 Memory Usage: 14.4 MB, less than 52.49% of Swift online submissions for Two Sum.
 */

func twoSumB(_ nums: [Int], _ target: Int) -> [Int] {
    
    var numMap = [Int:Int]()
    var rhs = 0
    for (index, lhs) in nums.enumerated() {
        rhs = target - lhs;
        if  numMap[rhs] != nil {
            return [numMap[rhs]!, index]
        }
        numMap[lhs] = index
    }
    return [0,0]
}

/*
 Runtime: 44 ms, faster than 99.73% of Swift online submissions for Two Sum.
 Memory Usage: 14.3 MB, less than 72.79% of Swift online submissions for Two Sum.
 */


