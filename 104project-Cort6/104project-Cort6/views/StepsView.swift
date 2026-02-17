//
//  StepsView.swift
//  104project-Cort6
//
//  Created by Naqui Darby on 2/5/26.
//

import SwiftUI

struct StepsView: View {
    var body: some View {
        
        VStack(spacing: 60) {
            
            VStack(spacing: 16){
              Text("Goal Achieved!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color("Accent"))
                    .brightness(-0.3)
                
                
              Text("Share with Friends")
                    .font(.title2)
            }
            
            VStack(spacing: 16){
                
                HStack{
                    Image("Picture")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                       
                    
                    Text("Greg Walker")
                        .font(.headline)
                    
                    Spacer()
                    
                    Image(systemName: "waveform.path.ecg")
                        .font(.headline)
                        .foregroundStyle(Color("Accent"))
                        
                    
                }
                .padding()
                
               
                
                VStack{
                    
                    ZStack{
                        Circle()
                            .stroke(lineWidth: 12)
                            .foregroundStyle(Color("Accent"))
                            //.padding(90)
                        
                        
                        VStack{
                            Image(systemName: "figure.walk")
                                .font(.largeTitle)
                            
                            Text("8000")
                                .font(.title.bold())
                            
                            Text("Steps Today")
                                .font(.subheadline)
                            
                            
                        }
                        
                    }.frame(width: 160, height: 160)
                        .padding()
                        
                    
                }
                HStack{
                    VStack{
                        
                        Text("1000 Cal")
                            .font(.headline.bold())
                        
                        Text("Cal Burned")
                            .font(.footnote)
                    }
                        Spacer()
                       
                    VStack{
                        Text("8000")
                            .font(.headline.bold())
                        
                        
                        Text("Daily Goal")
                            .font(.footnote)
                    }
                    
                    
                }
                .padding()
                
            }
            .background(.white)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.4),radius: 6)
            .padding(.horizontal, 32)
            
            VStack(spacing: 16){
                
                Text("Share your achievement with the #walkforlife")
                    .font(.body)
                
                Button("Share with Friends") {
                    
                }
                .font(.body)
                .buttonStyle(.borderedProminent)
                .brightness(-0.1)
                
                Button("Not Now"){
                    
                }.font(.body)
                    .foregroundStyle(Color("Accent"))
            }
               
            
        }
        .frame(maxWidth: .infinity, maxHeight:  .infinity)
        .background(Color("Background"))
        
    }
}

#Preview {
    StepsView()
}
