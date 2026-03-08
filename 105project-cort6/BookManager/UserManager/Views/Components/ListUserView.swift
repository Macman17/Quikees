//
//  ListUserView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import SwiftUI

struct ListUserView: View {
    let user : User
    
    var body: some View {
        
        
        HStack{
            Image(user.profilePicture)
                .resizable()
                
                .scaledToFit()
                .frame(width: 120,height: 120 )
                .clipShape(Circle())
                .padding()
            VStack(alignment: .leading){
                
                Text(user.firstName)
                    .font(.title.bold())
                Text(user.lastName)
                    .font(.title.bold())
                
                
                }
            }
        }
    }
