//
//  main.swift
//  Leet
//
//  Created by Dayson Dong on 2021-11-09.
//

import Foundation

class Solution4 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        

        let totalCount = nums1.count + nums2.count
        let isEven = totalCount % 2 == 0
        
        var medianFound = false
        var current = 0
        var runningIndex = 0

        var median = 0.0
        
        
        if isEven {
            var nums: [Int] = []

            let medianIndex1 = totalCount/2 - 1
            let medianIndex2 = totalCount/2

            for num in nums2 where !medianFound {
              
                    while current < nums1.count && nums1[current] <= num && !medianFound{
                        if runningIndex == medianIndex1 || runningIndex == medianIndex2 {
                            nums.append(nums1[current])
                        }
                        current += 1
                        runningIndex += 1
                        if runningIndex > medianIndex2 {
                            medianFound = true
                        }
                    }
                if runningIndex == medianIndex1 || runningIndex == medianIndex2 {
                    nums.append(num)
                }

                runningIndex += 1
                
                if runningIndex > medianIndex2 {
                    medianFound = true
                }
            }
            
            for i in current..<nums1.count {
                if runningIndex == medianIndex1 || runningIndex == medianIndex2 {
                    nums.append(nums1[i])
                }
                runningIndex += 1
                
                if runningIndex > medianIndex2 {
                    medianFound = true
                }
            }

            median = nums.reduce(0.0) { Double($0) + Double($1) } / Double(nums.count)
            
            
        } else {
            
            let medianIndex1 = (totalCount - 1) / 2
            
            for num in nums2 where !medianFound {
              
                    while current < nums1.count && nums1[current] <= num && !medianFound {
                        if runningIndex == medianIndex1 {
                            median = Double(nums1[current])
                            medianFound = true
                        }
                        
                        current += 1
                        runningIndex += 1
                    }
                
                if runningIndex == medianIndex1 {
                    median = Double(num)
                    medianFound = true
                }

                runningIndex += 1
    
            }
            
            for i in current..<nums1.count where !medianFound {
                if runningIndex == medianIndex1 {
                    median = Double(nums1[i])
                    medianFound = true
                }
                runningIndex += 1
            }
        }

        return median
        
    }
}
/*
Runtime: 76 ms, faster than 76.05% of Swift online submissions for Median of Two Sorted Arrays.
Memory Usage: 14.2 MB, less than 97.64% of Swift online submissions for Median of Two Sorted Arrays.
                                                                    */

let s = Solution4()

let m = s.findMedianSortedArrays([], [2,3])
print(m)

class Solution3 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var current = 0
        
        var nums = [Int]()
        
        for num in nums2 {
          
                while current < nums1.count && nums1[current] <= num {
                    nums.append(nums1[current])
                    current += 1
                }

            nums.append(num)
        }
        
        for i in current..<nums1.count {
            nums.append(nums1[i])
        }
        
        let count = nums.count
  
        return count % 2 == 0 ? Double(nums[count/2] + nums[(count/2)-1])/2.0 : Double(nums[(count-1)/2])
        
    }
}

/*
 Runtime: 75 ms, faster than 77.70% of Swift online submissions for Median of Two Sorted Arrays.
 Memory Usage: 14.4 MB, less than 69.93% of Swift online submissions for Median of Two Sorted Arrays.

 */

class Solution2 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var current = 0
        var nums = nums1
        for num in nums2 {
          
                while current < nums.count && nums[current] <= num {

                    current += 1
                }
            
          
            nums.insert(num, at: current)
            current += 1
        }
        
        let count = nums.count
        return count % 2 == 0 ? Double(nums[count/2] + nums[(count/2)-1])/2.0 : Double(nums[(count-1)/2])
        
    }
}

/*
 Runtime: 118 ms, faster than 21.62% of Swift online submissions for Median of Two Sorted Arrays.
 Memory Usage: 14.2 MB, less than 97.47% of Swift online submissions for Median of Two Sorted Arrays.
 */


class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        var currentIndex1 = 0
        var currentIndex2 = 0
        var mergedArray = [Int]()
        
        while currentIndex1 < nums1.count && currentIndex2 < nums2.count {
            
            if nums1[currentIndex1] < nums2[currentIndex2] {
                mergedArray.append(nums1[currentIndex1])
                currentIndex1 += 1
            } else {
                mergedArray.append(nums2[currentIndex2])
                currentIndex2 += 1
            }
            
            
        }
        
        if currentIndex1 == nums1.count && currentIndex2 < nums2.count {
            for i in currentIndex2..<nums2.count {
                mergedArray.append(nums2[i])
            }
        } else if currentIndex2 == nums2.count && currentIndex1 < nums1.count {
            for i in currentIndex1..<nums1.count {
                mergedArray.append(nums1[i])
            }
        }
        
        let count = mergedArray.count
        
        return count % 2 == 0 ? Double(mergedArray[count/2] + mergedArray[(count/2)-1])/2.0 : Double(mergedArray[(count-1)/2])
        
    }
}

/*
Runtime: 78 ms, faster than 71.12% of Swift online submissions for Median of Two Sorted Arrays.
Memory Usage: 14.2 MB, less than 90.54% of Swift online submissions for Median of Two Sorted Arrays.
*/





//Online Solution
class Solution5 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        
        if m > n {
            return findMedianSortedArrays(nums2, nums1)
        }
        var halfLength: Int = (m + n + 1) >> 1
        var b = 0, e = m
        var maxOfLeft = 0
        var minOfRight = 0
                
        while b <= e {
            let mid1 = (b + e) >> 1
            let mid2 = halfLength - mid1
            
            if mid1 > 0 && mid2 < n && nums1[mid1 - 1] > nums2[mid2] {
                e = mid1 - 1
            } else if mid2 > 0 && mid1 < m && nums1[mid1] < nums2[mid2 - 1] {
                b = mid1 + 1
            } else {
                if mid1 == 0 {
                    maxOfLeft = nums2[mid2 - 1]
                } else if mid2 == 0 {
                    maxOfLeft = nums1[mid1 - 1]
                } else {
                    maxOfLeft = max(nums1[mid1 - 1], nums2[mid2 - 1])
                }
                
                if (m + n) % 2 == 1 {
                    return Double(maxOfLeft)
                }
                
                if mid1 == m {
                    minOfRight = nums2[mid2]
                } else if mid2 == n {
                    minOfRight = nums1[mid1]
                } else {
                    minOfRight = min(nums1[mid1], nums2[mid2])
                }
                
                break
            }
        }
        return Double(maxOfLeft + minOfRight) / 2.0
    }
}
