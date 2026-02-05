import UIKit

var fruitArray: [String] = [
    "Apple", "Banana", "Orange", "Strawberry", "Pineapple", "Mango", "Kiwi", "Grapes", "Watermelon", "Blueberry"
    
]
var fruitSet: Set<String> = [
    "Apple", "Banana", "Orange", "Strawberry", "Pineapple", "Mango", "Kiwi", "Grapes", "Watermelon", "Blueberry"
]

var fruitDictionary: [String: String] = [
    "Apple": "Red", "Banana": "Yellow", "Orange": "Orange", "Strawberry": "Red", "Pineapple": "Brown", "Mango": "Yellow", "Kiwi": "Green", "Grapes": "Purple", "Watermelon": "Green", "Blueberry": "Blue"
]

print("---Create---")
print("Array: \(fruitArray)")
print("Array: \(fruitSet)")
print("Array: \(fruitDictionary)")

// Add for array append or insert
fruitArray.append("Star Fruit")

//Set insert
fruitSet.insert("Star Fruit")

// Dictionary updateValue

fruitDictionary.updateValue("Yellow", forKey: "Star Fruit")

print("---Update---")
print("Array: \(fruitArray)")
print("Array: \(fruitSet)")
print("Array: \(fruitDictionary)")

//remove
//Array remove by index
fruitArray.remove(at: 0)

//Set remove by element name
fruitSet.remove("Apple")

//Dictionary remove by key
fruitDictionary.removeValue(forKey: "Apple")

print("---Remove---")
print("Array: \(fruitArray)")
print("Array: \(fruitSet)")
print("Array: \(fruitDictionary)")

//search/contain
print("--- Contain ---")
print("Array contains Apple? \(fruitArray.contains("Apple"))")
print("Set contains Apple? \(fruitSet.contains("Apple"))")
print("Dictionary contains Apple? \(fruitDictionary.keys.contains("Apple"))")


//Iterate
print("--- Iterate ---")
print("Array:")
for fruit in fruitArray {
    print(fruit)
}

print("Set:")
for fruit in fruitSet{
    print(fruit)
}


print("Dictionary:")
for (color, fruit) in fruitDictionary{
    print("\(color), \(fruit)")
}


print("--- Sort ---")
print("Array:", fruitArray.sort(by: >))
print("Set:", fruitSet.sorted())

let sortedDictionary = fruitDictionary.sorted(){$0.key < $1.key}

print(sortedDictionary)
