//
//  GradesView.swift
//  103project-Cort6
//
//  Created by Naqui Darby on 2/3/26.
//

import SwiftUI

struct GradesView: View {
    
    
    
    @State private var studentGrades: [Int] = [85, 98, 90, 75, 88, 92]
    
    @State private var studentList: [String] = [ "Bob", "Alice", "Sam", "Lisa", "Sam" ]
    
    @State private var newItem: String = ""
    
    func averageGrade() -> Double {
               
               let total: Int = studentGrades.reduce(0, +)
               
               return Double(total) / Double(studentGrades.count)
           }
    
   
    
    var body: some View {
        
       
        
        NavigationView{
            
            ZStack{
                
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("Student Grades")
                        .font(.largeTitle)
                        .foregroundStyle(Color.blue)
                        .bold()
                        .padding()
                    
                    Text("Average Grade is: \(averageGrade(),specifier:"%.2f")")
                    List{
                        ForEach(studentList.indices, id:\.self) { index in
                            Text("\(studentList[index]) - \(studentGrades[index]) ")
                            
                        }
                        
                        HStack {
                            VStack{
                                
                                TextField("Type name...", text: $newItem)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(30)
                                    .border(Color.gray)
                                
                                TextField("Type Grade...", text: $newItem)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(30)
                                    .border(Color.gray)
                                
                            }
                            
                            Button(action:{
                                studentList.append(newItem)
                                studentGrades.append(Int(newItem) ?? 0)
                                
                                newItem = ""
                            }){
                                Image(systemName: "arrowshape.up.fill")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundStyle(Color.white)
                                    .cornerRadius(30)
                                
                            }
                            
                        }
                        .padding(30)
                        
                    }
                    
                    
                    
                    
                }
                .navigationBarTitle("Student Grades", displayMode: .inline)
                
                .toolbar{
                    Menu{
                        
                        Button("Sort A-> Z"){
                            
                            studentGrades.sort()
                        }
                        
                        
                        
                    }//END: MENU
                    label:{
                        Image(systemName: "line.horizontal.3.decrease")
                            .imageScale(.large)
                    }
                }
            }}}}

#Preview {
    GradesView()
}
