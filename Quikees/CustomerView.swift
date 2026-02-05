//
//  CustomerView.swift
//  Quikees
//
//  Created by Naqui Darby on 1/22/26.
//

import SwiftUI

struct CustomerView: View {
    
    var customers: [Customer] = [
            Customer(
            
            name: "Keelah",
            email: "KeeBee@email.com",
            visit: 4,
            age: 15,
            address: "23443 dove st. Grape, Fl 23049"
        ),
            Customer(
                
                name: "Kee",
                email: "KeeBe@email.com",
                visit: 48,
                age: 65,
                address: "23483 dove st. Grape, Fl 23049"
            )

    ]
    
    var body: some View {
        NavigationStack{
        List(customers){ c in
            NavigationLink(c.name){
                Divider()
                VStack{
                    VStack{
                        Text(c.contactCard())
                        
                            .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(7)
                        
                        if c.visit > 3  {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("Loyal Customer")
                                .font(.caption)

                        }
                    }.background(Color(.systemGray5))
                    Divider()
                    
                }
            }
            }
        }
        .navigationTitle(Text("Customer List"))
    }
}

#Preview {
    CustomerView()
}
