//
//  MainView.swift
//  BookManager
//
//  Created by Naqui Darby on 2/19/26.
//

import SwiftUI

struct MainView: View {
    @State private var showAddSheets: Bool = false
    @State var users = getUser()
    @State var newUser = getNewUser()
    
    
    
    
    var body: some View {
        NavigationStack {
            List($users, id:\.self.id){
                $user in
                NavigationLink(destination: DetailsView (user: $user)){
                    ListUserView(user: user)
                }
            }
            .navigationTitle("User Manager")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Add User", action:{
                showAddSheets.toggle()
            }))
            .sheet(isPresented: $showAddSheets) {
                if(!newUser.firstName.isEmpty){
                    users.append(newUser)}
                newUser = getNewUser()
                
            }content:{
                AddEditUserView(user: $newUser)
            }
        }
    }
    
}

#Preview {
    MainView()
}
