import UIKit

let dish = ["Pizza", "Pasta", "Burger"]

print(dish[0])
print(dish[1])


var orders = [String]()
orders.append("Soup")
orders.append("Cake")


print(orders)

let menuPrices = [
    "Pizza" : 6.99,
    "Salad" : 3.99,
    "Burger" : 5.99,
    
]

print(menuPrices["Salad"]!)

let drinkPrices = [
    "Soft Drink": 1.99,
    "Wine": 4.99,
    "Beer": 7.99
]
print(drinkPrices["Wine"]!)

drinkPrices.forEach{drinks, price in
    if price > 2 {
        print("\(drinks): $\(price)")
    }
}


let fruits = [
    "Apple": 1.49,
    "Banana": 1.05,
    "Orange": 1.90
]

fruits.forEach{fruit, price in
    if price > 1 {
        print("\(fruit): $\(price)")
    }
}


