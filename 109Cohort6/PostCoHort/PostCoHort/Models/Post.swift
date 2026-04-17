//
//  Post.swift
//  PostCoHort
//
//  Created by Naqui Darby on 4/14/26.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
