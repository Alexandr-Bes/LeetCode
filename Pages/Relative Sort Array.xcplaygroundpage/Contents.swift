/*
 Given two arrays arr1 and arr2, the elements of arr2 are distinct, and all elements in arr2 are also in arr1.
 Sort the elements of arr1 such that the relative ordering of items in arr1 are the same as in arr2.  Elements that don't appear in arr2 should be placed at the end of arr1 in ascending order.
 https://leetcode.com/problems/relative-sort-array/submissions/
*/
import Foundation

func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var result = [Int]()
    let sortedInput = arr1.sorted()

    for i in arr2 {
        for elem in sortedInput {
            if elem == i {
                result.append(elem)
            }
        }
    }
    var unique = Array(Set(result).symmetricDifference(Set(arr1)))
    unique.sort()
    result += unique

    return result
}
