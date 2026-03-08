//
//  AddEditUserView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import SwiftUI

struct AddEditUserView: View {
    
    @Binding var user: User
    @Environment(\.dismiss) var dismiss
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var profilePicture = ""
    @State private var hobbies = ""
    @State private var age: Int = 0
    @State private var profession = ""
    
    
    
    init(user: Binding<User>){
        self._user = user
        self.firstName = user.wrappedValue.firstName
        self.lastName = user.wrappedValue.lastName
        self.email =  user.wrappedValue.email
        self.password =  user.wrappedValue.password
        self.username = user.wrappedValue.username
        self.profilePicture = user.wrappedValue.profilePicture
        self.hobbies = user.wrappedValue.hobbies
        self.age = user.wrappedValue.age
        self.profession = user.wrappedValue.profession
        
        
        
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("User details")){
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                        .multilineTextAlignment(.leading)
                    TextField("Password", text: $password)
                    TextField("Username", text: $username)
                    TextField("Profile Image", text: $profilePicture)
                    TextField("Profession", text: $profession)
                    TextField("Hobbies", text: $hobbies)
                        .multilineTextAlignment(.leading)
                    Stepper(value: $age, in: 0...100) {
                        HStack{
                            Text("Age")
                            Spacer()
                            Text("\($age.wrappedValue)")
                            // Label inside the closure
                        }
                    }
                    
                    
                    .navigationTitle("\(user.username.isEmpty ? "Add" : "Edit") Book")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") {
                                user.firstName = firstName
                                user.lastName = lastName
                                user.email = email
                                user.password = password
                                user.username = username
                                user.profilePicture = profilePicture
                                user.hobbies = hobbies
                                user.age = age
                                user.profession = profession
                                
                                dismiss()
                            }.disabled(username.isEmpty)
                            
                                .foregroundStyle(.blue)
                            
                            
                            
                        }
                        
                    }
                }
                
            }
        }
    }
}
