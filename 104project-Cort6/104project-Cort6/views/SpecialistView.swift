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
                                
                                Text("Categies")
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
                                    CategoryCardView(icon: "hand.and.spanrkle", title: "Masseges")
                                }
                            }
                            
                        }
                        
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("Secondary"))
                     
                        VStack(alignment: .leading){
                            
                            Text("Top Specialist")
                                .font(.title2).bold()
                            
                            ScrollView(.vertical, showsIndicators: false){
                                
                                VStack{
                                    Rectangle()
                                        .frame(width:350, height: 100)
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
