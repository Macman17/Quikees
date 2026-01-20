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
    let outside = "Yes"
    
    
    
    @State private var userName = ""
    @State private var guestCount = 0
    @State private var guestPhoneNumber = ""
    @State private var previewText = ""
    @State private var children = 0
    @State private var occassion = ""
    @State private var showMessage = true
    
    func guestLabel(_ count:Int) -> String {
        count == 1 ? "Guest" : "Guests"
    }
    
    func childLabel(_ count:Int) -> String {
        count == 1 ? "Child" : "Children"
    }
    
    func estimateTotal(_ adult: Int, _ children: Int) -> Double {
        let adultPrice = 15.0
        let childrenPrice = 9.0
        
        return Double(adult) * adultPrice + Double(children) * childrenPrice
    }
    
    func totalGuests(_ adult:Int, _ children: Int) -> String {
        let total = adult + children
        return "\(total) \(total == 1 ? "Guest" : "Guests")"
    }
    
   
    
    
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
            
            Toggle("Outdoor Seating", isOn: $showMessage)
            
            
            if showMessage{
                Text("We will do our best to secure outdoor seating for you")
                    .font(.footnote)
                    .foregroundColor(.blue)
                
            }
            
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
            
            
            Section(header: Text("Preview")){
                Text(previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .textSelection(.enabled)
                
                
            }
            Section(header: Text("Summary")){
                VStack{
                    HStack{
                        Text("Reservation details")
                            .font(.headline)
                        Spacer()
                        Image(systemName: "text.document")
                        
                    }
                    
                    HStack{Text("Name"); Spacer(); Text((userName))}
                    HStack{Text(guestLabel(guestCount)); Spacer(); Text("\(guestCount)")}
                    HStack{Text(childLabel(children)); Spacer(); Text("\(children)") }
                   
                    
                    HStack{
                        Text("Total Guest:")
                        Spacer()
                        Text("\(totalGuests(guestCount,children))")
                    }
                    HStack{
                        Text("Estimate:")
                        Spacer()
                        Text("$\(estimateTotal(guestCount,children),specifier: "%.2f")")
                        
                    }
                }
                .padding(10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
            }
            
        }
    }
    
}


#Preview {
    ReservationForm()
}

