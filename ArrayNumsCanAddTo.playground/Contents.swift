//typealias Num = AdditiveArithmetic & Hashable


func array(_ array: [Int], contains number: Int) -> Bool {
  if array.isEmpty {
    return false
  }
  
  var setOfNumbers = Set(array)
  var containsNumber = false
  
  // Convert to set and brute force through!
  for currentNum in setOfNumbers {
    let twin = number - currentNum
    setOfNumbers.remove(currentNum)
    if setOfNumbers.contains(twin) {
      containsNumber = true
      break
    }
  }
  
  return containsNumber
}

let array1 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
let val = 32


dump(array(array1, contains: val))
