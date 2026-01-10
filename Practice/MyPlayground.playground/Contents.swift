import UIKit


var resturantName = "Quikees"
print("Welcome to \(resturantName)")

let city = "London"

print("Our resturant is located in: \(city)")

var specialDish = "Fish and Chips"

var availableTable = 5

var dishPrice = 10.50

var isOpen = true

print("Today's special is: \(specialDish) - $\(dishPrice)")

var ownerName = "Naqui Darby"

var numberOfTable = 5

print("Tonight \(ownerName) is hosting a \(numberOfTable) table dinner")


var cake = 3.99
var numberOfGuest = 12.00
var reservedName = "Keelah"
var cakeType = "Chocolate"

print("\(reservedName) will have \(numberOfGuest) that will have a \(cakeType) cake for \(cake)")
var total = cake * numberOfGuest
var tip = 0.15 * total

print("\(reservedName) total = \(total + tip)")
