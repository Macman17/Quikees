import UIKit

func greet(person: String) -> String {
    let greeting = "Hello" + person
    return greeting
    
}


let message = greet(person: "World")
print(message)

func add(ai: Int, bi:Int) -> Int {
    return ai + bi
}

let result = add(ai: 2 , bi: 3)
print("Sum of : 2 + 3 is \(result)")


func multiply(_ ait: Int, _ bit:Int) -> Int {
    return ait*bit
}
print(multiply(2,3))

func deliveryTime(min: Int) -> String{
    return "Ready in \(min) minutes"
    
}

let delivery = deliveryTime(min: 10)
print(delivery)

func welcomeStudent(name: String) -> String {
    return "Welcome, \(name)! Ready to learn Swift?"
    
}
let welcome = welcomeStudent(name: "Naqui")
print(welcome)


func greetCustomer (name: String){
    print("Welcome \(name)")
}
greet(person: "Kee")

func printMenuItem(name: String, price: Double) {
    print("\(name):$\(price)")
}

func renderRow(name: String, price: Double) -> String {
    return "My Row: \(name):$\(price)"
}

let menu = [
    "pizza":6.99,
    "burger":8.99,
    "salad":4.99
]
for (name,price) in menu {
    
    print ("\(name):$\(price)")
    
}

for (name,price) in menu {
    renderRow(name:name, price:price)
}
}
