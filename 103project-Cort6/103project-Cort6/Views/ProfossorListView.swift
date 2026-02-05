
//
//  ProfossorListView.swift
//  103project-Cort6
//
//  Created by Naqui Darby on 1/31/26.
//

import SwiftUI

struct ProfossorListView: View {
    
    var professorList: [Professor] = [
        Professor(lastName: "Kee", firstName: "Bee", phoneNumber: "284-3992"),
        Professor(lastName: "Fat", firstName: "Man", phoneNumber: "384-2943")
    ]
    
    @State private var lastName: String = ""
    @State private var firstName: String = ""
    
    @State private var phoneNumber: String = ""
    
    
    var body: some View {
        Text("Professor Directory")
            .font(.title)
            .bold()
        
        List(professorList, id:\.phoneNumber) { professor in
            Text("\(professor.firstName) \(professor.lastName) - \(professor.phoneNumber)")
            
        }
        
        VStack{
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Phone Number", text: $phoneNumber)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
        }
        .padding()
        
        Button("Add Professor") {
            
            let newProfessor = Professor(lastName: lastName, firstName: firstName, phoneNumber: phoneNumber)
            
            professorList
            
            firstName = ""
            lastName = ""
            phoneNumber = ""
        }
        .buttonStyle(.borderedProminent)
        .bold()
    }
}

#Preview {
    ProfossorListView()
}
