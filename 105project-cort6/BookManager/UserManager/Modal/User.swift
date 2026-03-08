//
//  User.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import Foundation



struct User: Identifiable{
    let id: UUID = UUID()
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var username: String
    var profilePicture: String
    var hobbies: String
    var age: Int
    var profession: String
}
