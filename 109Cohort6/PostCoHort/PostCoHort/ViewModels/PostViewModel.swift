//
//  PostViewModel.swift
//  PostCoHort
//
//  Created by Naqui Darby on 4/14/26.
//

import Foundation
import Combine

@MainActor
class PostViewModel:ObservableObject{
    
  @Published var post: [Post] = []
  @Published var errorMessage: String = ""
    
    let service  = PostService()
    
    func loadPosts() async{
        do{
            post = try await service.fetchPosts()
        }catch let error as PostService.NetworkError{
            switch error{
                case .invalidURL:
                errorMessage = "Invalid URL"
            case.invalidResponse:
                errorMessage = "Invalid Response"
            case .invalidStatusCode:
                errorMessage = "Invalid Status Code"
            case .decodingError:
                errorMessage = "Decoding Failed"
                
            }
        } catch {
            errorMessage = "Something went wrong"
        }
    }
    
}
