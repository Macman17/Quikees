//
//  Professor.swift
//  103project-Cort6
//
//  Created by Naqui Darby on 1/31/26.
//

import SwiftUI

class Professor {
    var lastName: String
    var firstName: String
    var phoneNumber: String
    
    init(lastName: String, firstName: String, phoneNumber: String) {
        self.lastName = lastName
        self.firstName = firstName
        self.phoneNumber = phoneNumber
    }

    
}

class Student {
    var name: String
    var age: Int
    var grade: [Int]
    
    
    init(name: String, age: Int, grade: [Int]) {
        self.name = name
        self.age = age
        self.grade = grade
        
    }
 
    
    
}




