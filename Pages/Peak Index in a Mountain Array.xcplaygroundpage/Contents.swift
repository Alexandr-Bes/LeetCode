// Returns the index of the biggest number in array
//
// https://leetcode.com/problems/peak-index-in-a-mountain-array/submissions/

import Foundation


func peakIndexInMountainArray(_ A: [Int]) -> Int {
    guard let max = A.max() else { return 0 }
    guard let res = A.firstIndex(of: max) else { return 0}
    return Int(res)
}

