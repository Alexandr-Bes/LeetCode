
// Count a number of characters in string J contains in a string S
//
// https://leetcode.com/problems/jewels-and-stones/

import Foundation

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var count = 0
    for i in J {
        for i1 in S {
            if i == i1 {
                count += 1
            }
        }
    }
    return count
}

