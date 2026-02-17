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
        VStack{
            
            ZStack{
                Image(systemName:"person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .clipShape(Circle())
                    .foregroundStyle(Color("Primary"))
                    
                VStack(spacing: 40){
                    
                    HStack{
                        Text(specialist.name)
                            .font(Font.headline.bold())
                            .padding()
                            .foregroundStyle(Color("Primary"))
                        Image("star")
                        Text(String(specialist.rating))
                            .font(.subheadline)
                    
                    }
                    
                    HStack{
                        
                        
                    }
                    
                }
            }
            .frame(width: 350, height: 100)
        }
    }
}

#Preview {
    SpecialistContactCardView(name: "", rating: 0, )
}
