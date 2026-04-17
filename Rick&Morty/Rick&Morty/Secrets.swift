//
//  Secrets.swift
//  Rick&Morty
//
//  Created by Naqui Darby on 4/13/26.
//

import Foundation

enum Secrets{
    
    static var weatherAPIKey:String {
        guard let key  = Bundle.main.infoDictionary?["RM_API_KEY"] as? String else{
            fatalError("Couldnt read API key ")
        }
        return key
    }
    
}
