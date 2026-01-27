//
//  CustomerModel.swift
//  Quikees
//
//  Created by Naqui Darby on 1/22/26.
//

import Foundation

class Customer: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var visit: Int
    var age: Int
    var address: String
    
    init(name:String, email:String, visit:Int,  age:Int, address:String){
        self.name = name
        self.email = email
        self.visit = visit
        self.age = age
        self.address = address
    }
    func greeting() -> String{
        return "Welcome back, \(name)"
    }
    func addVisit(){
        visit += 1
    }
    func summary() -> String {
        "\(name) - visited \(visit) times"
    }
    
    
    func contactCard() -> String {
        return """
        Name: \(name)
        Email: \(email) 
        Age: \(age)
        Address: \(address)
        You currently have \(visit) visits! 
        """
    }
    
}
