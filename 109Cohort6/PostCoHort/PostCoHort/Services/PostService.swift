//
//  PostService.swift
//  PostCoHort
//
//  Created by Naqui Darby on 4/14/26.
//

import Foundation

class PostService{
    enum NetworkError: Error {
        case invalidURL
        case invalidResponse
        case invalidStatusCode
        case decodingError
        
    }
    
    func fetchPosts() async throws -> [Post]{
        
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts")
        else {throw NetworkError.invalidURL}
        
        let(data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.invalidStatusCode
        }
        
        do{
            return try JSONDecoder().decode([Post].self, from: data)
        }catch{
            throw NetworkError.decodingError
        }
    }
}
