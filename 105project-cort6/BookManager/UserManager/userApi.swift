//
//  userApi.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import Foundation

func getUser() -> [User] {
    return [ User(firstName: "John", lastName: "Snow", email: "john@snow.com", password: "test123", username: "johnsnow", profilePicture: "Avatar1", hobbies: "hikinhg, fishing, hiking",age: 23, profession: "Teacher"), User(firstName: "Craig", lastName: "Snow", email: "craig@snow.com", password: "test123", username: "craigsnow", profilePicture: "Avatar2", hobbies: "hiking, fishing, hiking",age: 23, profession: "Teacher"), User(firstName: "Wayne", lastName: "Snow", email: "wayne@snow.com", password: "test123", username: "waynesnow", profilePicture: "Avatar3", hobbies: "hiking, fishing, hiking",age: 23, profession: "Teacher") ]
    
}

func getNewUser() -> User {
    return User(firstName: "", lastName: "", email: "", password: "", username: "", profilePicture: "", hobbies: "", age: 0, profession: "")
}
