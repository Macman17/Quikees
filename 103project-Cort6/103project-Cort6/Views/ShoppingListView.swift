//
//  ShoppingListView.swift
//  103project-Cort6
//
//  Created by Naqui Darby on 1/27/26.
//

import SwiftUI

struct ShoppingListView: View {
   
    @State private var shoppingList: [String] = ["Apple", "Orange"]
    @State private var newItem: String = ""
    

    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("Shopping List")
                        .font(.largeTitle)
                        .foregroundStyle(Color.blue)
                        .bold()
                    
                    List {
                        ForEach(shoppingList, id:\.self) { item in
                                Text(item)
                        }
                    
                    }
                    
                    HStack {
                        TextField("Type an item name...", text: $newItem)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                        
                        Button(action:{
                            shoppingList.append(newItem)
                            
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
            .navigationBarTitle("My Shopping App", displayMode: .inline)
            
            .toolbar{
                Menu{
                
                    Button("Sort A-> Z"){
                        
                        shoppingList.sort()
                    }
                    
                    Button("Reverse"){
                        
                        shoppingList.reverse()
                    }
                    
                }//END: MENU
                label:{
                    Image(systemName: "line.horizontal.3.decrease")
                        .imageScale(.large)
                }//End: Label
            }//End: toolbar
            
            //END: ZStack-Backgroud Color
        }//END: NavigationView
        
    }// END:Body
}//END: ShoppingList

#Preview {
    ShoppingListView()
}
