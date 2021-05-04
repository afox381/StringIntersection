/*
 String Intersection

Have the function FindIntersection(strArr) read the array of strings stored in strArr which will contain 2 elements: the first element will represent a list of comma-separated numbers sorted in ascending order, the second element will represent a second list of comma-separated numbers (also sorted). Your goal is to return a comma-separated string containing the numbers that occur in elements of strArr in sorted order. If there is no intersection, return the string false.
Examples

Input: ["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]
Output: 1,4,13
Input: ["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"]
Output: 1,9,10
*/

import Foundation

func FindIntersection(_ strArr: [String]) -> String {
    guard strArr.count == 2,
          let firstIntegerArray = strArr.first?.components(separatedBy: ", ").compactMap({ Int($0) }),
          let secondIntegerArray = strArr.last?.components(separatedBy: ", ").compactMap({ Int($0) }) else {
        return "false"
    }
    
    let sortedIntersectionIntegers = Set(firstIntegerArray).intersection(secondIntegerArray).sorted(by: <)
    
    if sortedIntersectionIntegers.isEmpty {
        return "false"
    } else {
        return sortedIntersectionIntegers.reduce("", { ($0.isEmpty ? "" : "\($0),") + String($1) })
    }
}

print(FindIntersection(["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]))
print(FindIntersection(["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"]))
print(FindIntersection(["1, 3, 9, 10, 17, 18", "2, 4, 6, 8"]))
print(FindIntersection(["1, 3, 9, 10, 17, 18", "2, 4, 6, 8", "1"]))
print(FindIntersection(["1, 2", "1"]))
print(FindIntersection([]))
print(FindIntersection(["13, 7, 4, 3, 1", "15, 13, 4, 2, 1"]))



// keep this function call here
//print(FindIntersection(readLine(stripNewline: true)))
