//
//  DetailsView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import SwiftUI

struct DetailsView: View {
    @Binding var user: User
    @State private var showEditSheets: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(user.profilePicture)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160,height: 160 )
                    .clipShape(Circle())
                    .padding()
                
                VStack(alignment: .leading){
                    VStack{
                        Text(user.firstName)
                            .font(.largeTitle.bold())
                        
                        Text(user.lastName)
                            .font(.largeTitle.bold())
                        
                        Text(user.profession)
                            .font(.subheadline)
                        
                        
                    }
                }
            }
            
            HStack{
                
                
                VStack(alignment: .leading){
                    Section(header: Text("Personal Information").font(.headline.bold())){
                        Text("Email: \(user.email)")
                        Text("Username: \(user.username)")
                        Text("Password: \(user.password)")
                        Text("Age: \(user.age)")
                        Text("\(user.hobbies)")
                    }
                    .padding()
                    
                    if (user.age > 18 || (user.age == 18)){
                        VStack( alignment: .leading){
                            
                            HStack(){
                                Text("Welcome to your user dashboard")
                                    .font(.headline.bold())
                                    .foregroundStyle(Color(.green))
                                Spacer()
                                
                                
                            }
                        }
                        .frame(width: .infinity, height: .infinity)
                        .padding()
                        Spacer()
                        
                    }
                }
                }
                
                
            }
            .font(.body)
            .frame(maxWidth: .infinity)
            .background(Color(.white))
            .cornerRadius(20)
        .padding(.horizontal)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action:{
                   showEditSheets.toggle()
        }))
        .sheet(isPresented: $showEditSheets) {
            AddEditUserView(user: $user)
            
        }
        .background(Color(.primary))
    }
        
}
