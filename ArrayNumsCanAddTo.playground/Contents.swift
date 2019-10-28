/*
# 1 This problem was asked by Google.

 ##  Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

 For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

 Bonus: Can you do this in one pass?

 */


/// This function outputs if the number can be made up of 2 digits in the array
/// - Parameter array: The Array
/// - Parameter number: The Number to be checked
/// - Warning: The solution can fail when an element repeats in the array
/// - Discussion: To have a single pass through the array, we convert the array to Set as operations on Set such as `Set.contains(element)` take O(1) while `Array.contains(element)` take O(n) time. Once an element is extracted from the Set, I remove it from the set, just so as not to have `contains` return true on it. Once a match is found, the flag turns true and program breaks off the  loop. Else it continues and exhausts the Set. The flag is returned
/// - Complexity: O(n). The Array is converted to set in O(n) time, while the set's value is accessed in O(1) time
/// -
func array(_ array: [Int], contains number: Int) -> Bool {
  if array.isEmpty {
    return false
  }
  
  // Convert to set and brute force through!
  var setOfNumbers = Set(array)
  var containsNumberFlag = false
  
  for currentNum in setOfNumbers {
    let twin = number - currentNum
    setOfNumbers.remove(currentNum)
    if setOfNumbers.contains(twin) {
      containsNumberFlag = true
      break
    }
  }
  
  return containsNumberFlag
}

let array1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
let val = 32


dump(array(array1, contains: val))
