//
//  ReservationForm.swift
//  Quikees
//
//  Created by Naqui Darby on 1/8/26.
//

import SwiftUI
    
struct ReservationForm: View {
    
    let resturantName = "Quikees"
    let maxGuests = 10
    
    
    
    @State private var userName = ""
    @State private var guestCount = 1
    @State private var guestPhoneNumber = ""
    @State private var previewText = ""
    @State private var children = 0
    @State private var occassion = ""
    @State private var showMessage = true
    
    
    var body: some View {
        
        Form{
            Section{
                Text(resturantName)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Reservation Form")
                    .foregroundColor(.secondary)
            }
            
            Section(header: Text("Your Information")){
                TextField("Name", text: $userName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                
                if userName.isEmpty{
                    Text("Please enter a name")
                        .font(.footnote)
                        .foregroundColor(.red)
                    
                }
            }
            
             Section(header: Text("Party Details")){
                
                TextField ("Occassion", text: $occassion)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                 
                    if userName.isEmpty{
                        Text("Please enter a occassion")
                            .font(.footnote)
                            .foregroundColor(.red)
                        
                    }
                }
                
                Stepper("Guests \(guestCount)", value: $guestCount, in: 1...maxGuests)
                
                if guestCount >= 8{
                    Text("Large Parties - we will do our best to accommadate you")
                        .font(.footnote)
                        .foregroundColor(.orange)
                    
                }
                
                Stepper("Children: \(children)", value: $children, in: 1...10)
                
                if children >= 1 {
                    Text("Kids menu available")
                        .font(.footnote)
                        .foregroundColor(.green)
                }
                
                TextField("Phone Number", text: $guestPhoneNumber )
                    .keyboardType(.numberPad)
            
            
                Button("Preview Reservation"){
                    previewText = """
                    Reservation for:
                    Name:\(userName)
                    Occassion:\(occassion)
                    Guest:\(guestCount)
                    Children: \(children)
                    Phone\(guestPhoneNumber)
                    
                    """
                    
                }.disabled(userName.isEmpty)
            }
            
        Section(header: Text("Preview")){
            Text(previewText)
                .font(.footnote)
                .foregroundColor(.secondary)
                .textSelection(.enabled)
            
        
            }
        }
        
    
}


#Preview {
    ReservationForm()
}

