//
//  SpecialistView.swift
//  104project-Cort6
//
//  Created by Naqui Darby on 2/10/26.
//

import SwiftUI

struct SpecialistView: View {
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                Color("Primary")
                    .ignoresSafeArea()
                
                VStack(spacing: 40){
                    
                    VStack(spacing: 20){
                        Text("Find Your \nTop Specialist ")
                            .font(.largeTitle.bold())
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        
                        TextField("Search for beaty specialist...", text: .constant(""))
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal, 40)
                    
                    VStack(spacing: 20){
                        
                        VStack{
                            
                            HStack{
                                
                                Text("Categories")
                                    .font(.title2.bold())
                                
                                Spacer()
                                
                                NavigationLink(destination: AllCategoriesView()){
                                    
                                    Text("See all")
                                        .font(.headline)
                                        .foregroundStyle(Color("Primary"))
                                }
                                .padding()
                            }
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                HStack(spacing: 40){
                                    CategoryCardView(icon: "hand.raised", title: "Nails")
                                    CategoryCardView(icon: "eye", title: "Lashes")
                                    CategoryCardView(icon: "wind", title: "Hair")
                                    CategoryCardView(icon: "hands.and.sparkles", title: "Massage")
                                }
                            }
                            
                        }
                        
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .background(Color("Secondary"))
                     
                        VStack(alignment: .leading){
                            
                            Text("Top Specialist")
                                .font(.title2).bold()
                                .foregroundStyle(Color("Secondary"))
                                
                            
                            ScrollView(.vertical, showsIndicators: false){
                                
                                VStack{
                                    SpecialistContactCardView(specialist: Specialist( name: "Dr. John Doe", specialty: "Nails", salaryRange: "$50-60", rating: 4.5, price: "£$$20-$50", ))
                                    
                                    SpecialistContactCardView(specialist: Specialist(name: "Hey", specialty: "Lashes", salaryRange: "10-30", rating: 5.00, price: "23.00"))
                                 
                                    
                                }
                            }
                        }
                    }
                    
                }
            }
        
        }
    }
}

#Preview {
    SpecialistView()
}
