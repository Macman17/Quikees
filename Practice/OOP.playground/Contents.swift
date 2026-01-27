import UIKit

/*
    OOP
 
 A class is used to define custom type of elements, it groups properties and behaviors (methods)
 It acts as a blueprint for creating objects
 
 --- SYNTAX ---
 
 class ClassName {
    var propertyName1: DataType
    var propertyName2: DataType
 
    init(propertyName1: DataType,propertyName2: DataType){
        self.propertyName1 = propertyName1
        self.propertyName2 = propertyName2
    }
    func functionName() -> ReturnType{
        return ...
    }
 }
 
*/

class Dog{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func bark(){
        print("\(name) says woof!")
    }
    
}

let dog1 = Dog(name: "Haze", age:1)

dog1.bark()

let dog2 = Dog(name: "Dexter", age:1)

dog2.bark()


class Customer{
    var name: String
    var email: String
    var visit: Int
    var phoneNumber: String
    var age: Int
    var address: String
    
    init(name:String, email:String, visit:Int, phoneNumber:String, age:Int, address:String){
        self.name = name
        self.email = email
        self.visit = visit
        self.phoneNumber = phoneNumber
        self.age = age
        self.address = address
    }
    func greeting() -> String{
        return "Welcome back, \(name)"
    }
    func addVisit(){
        visit += 1
    }
    func summary(){
        print("\(name) - visited \(visit) times")
    }
    
    func contactCard() -> String {
        return """
        Name: \(name) 
        Email: \(email) 
        Phone: \(phoneNumber)
        Age: \(age)
        Address: \(address)
        You currently have \(visit) visits! 
        """
    }
    
}

let customer1 = Customer(
    
    name: "Keelah",
    email: "KeeBee@email.com",
    visit: 4,
    phoneNumber: "555-555-5555",
    age: 15,
    address: "23443 dove st. Grape, Fl 23049"
)

print(customer1.greeting())
customer1.addVisit()
customer1.addVisit()
customer1.addVisit()
print(customer1.summary())
print(customer1.contactCard())



