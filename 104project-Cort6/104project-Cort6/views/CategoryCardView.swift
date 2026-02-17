//
//  CategoryCardView.swift
//  104project-Cort6
//
//  Created by Naqui Darby on 2/10/26.
//

import SwiftUI

struct CategoryCardView: View {
    
    let icon: String
    let title: String
    
    var body: some View {
        VStack{
            
            ZStack{
                
                Circle()
                    .foregroundStyle(Color("Accent"))
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .bold()
                    .foregroundStyle(Color.white)
               
                
                
                
            }
            .frame(maxWidth: 60, maxHeight: 60)
        
            VStack{
                    Text(title)
                                           }
        }
    }
        
}

#Preview {
    CategoryCardView(icon: "star", title: "Nails")
}
