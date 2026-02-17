//
//  SpecialistModel.swift
//  104project-Cort6
//
//  Created by Naqui Darby on 2/10/26.
//

import Foundation

class Specialist
{
    var name: String
    var specialty: String
    var salaryRange: String
    var rating: Double
    var price: String
    
    
    init(name: String, specialty: String, salaryRange: String, rating: Double, price: String)
    {
        self.name = name
        self.specialty = specialty
        self.salaryRange = salaryRange
        self.rating = rating
        self.price = price
    }
}
