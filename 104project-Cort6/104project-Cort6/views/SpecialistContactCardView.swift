//
//  SpecialistContactCardView.swift
//  104project-Cort6
//
//  Created by Naqui Darby on 2/10/26.
//

import SwiftUI

struct SpecialistContactCardView: View {
    let specialist: Specialist
    
    
    var body: some View {
        HStack(spacing: 15){
            
            Image(systemName:"person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(10)
                .background(Color("Primary"))
                .clipShape(Circle())
                .foregroundStyle(.white)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(specialist.name)
                    .font(.headline)
                    .foregroundStyle(Color("Primary"))
                Text(specialist.specialty)
                    .font(.subheadline)
                
                Text(specialist.salaryRange)
                    .font(.subheadline)
                    .bold()
            }
            Spacer()
            
            VStack(spacing: 10) {
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.yellow)
                    Text("\(specialist.rating, specifier: "%.2f")")
                        .font(.caption)
                        .bold()
                }
                
                Button("Book") {
                    
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(Color("Primary"))
                .foregroundStyle(Color("Secondary"))
                .clipShape(Capsule())
            }
          
        }
        .padding()
        .background(
            Rectangle()
                .fill(Color("Secondary"))
                         )

        .frame(width: 300, height: 100)
        .cornerRadius(30)
        
    }
        
        
}
    
#Preview {
    SpecialistContactCardView(specialist: Specialist.init(name: "mee", specialty: "mee", salaryRange: "100-200", rating: 2.40, price: "3.99") ).border(.red)
}

