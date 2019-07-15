// Returns the number of elements not standing in the right position
//
// https://leetcode.com/problems/height-checker/

import Foundation

func heightChecker(_ heights: [Int]) -> Int {
    var count = 0
    var sortArray = heights.sorted()
    for number in 0...heights.count-1 {
        if heights[number] != sortArray[number] {
            count += 1
        }
    }
    return count
}

