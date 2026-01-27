//
//  MenuView.swift
//  Quikees
//
//  Created by Naqui Darby on 1/15/26.
//

import SwiftUI



struct MenuView: View {
    
    @State private var showMessage = false
    @State private var showAffordableItems = false
    @State private var selectedOption = "Option 1"
    @State private var showDessert = false
    @State private var isExpand = false
    
    @State private var showPremium = false
    
    
    let options: [String] = ["Option 1", "Option 2", "Option 3"]
    let menu: [String: Double] = [
        "Soup": 3.99,
        "House Salad": 4.49,
        "Pizza": 8.99,
        "Cajun Pasta": 10.99,
        "Steak": 14.99,
        "Grilled Cheese": 5.99,
        "Shepards Pie": 14.99,
        "Salmon with Asparagus": 18.99,
        "Grill Chicken": 12.99,
        "Caesar Salad": 6.49,
        "Chicken & Dumplings": 16.99
    ]
    
    var sortedMenu: [(name: String, price: Double)] {
        menu
            .sorted {$0.key < $1.key}
            .map{ (name: $0.key, price: $0.value) }
    }
    
    var displayMenu: [(name: String, price: Double)] {
        if showAffordableItems {
            return sortedMenu.filter { $0.price < 10}
                
        }else if showPremium{
            return sortedMenu.filter { $0.price > 10}
        }else{
            return sortedMenu
        }
    }
  
    var totalPriceOfVisibileItems: Double {
        displayMenu.reduce(0) { $0 + $1.price }
    }
    
    var totalNumberOfPremuimItems: Int {
        displayMenu.filter { $0.price > 10 }.count
            
    }
    
    var totalNumberOfAffordable: Int {
        displayMenu.filter { $0.price < 10
        }.count
    }
    
    var averagePrice: Double {
        let prices = displayMenu.map { $0.price }
        let total = prices.reduce(0, +)
        return total / Double(prices.count)
    }
    
    func priceFormatter(_ price: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(floatLiteral: price)) ?? "$0.00"
    }
    
    func getTotalItem() -> Int {
        
        return menu.count
    }
    
    func getHighestPrice() -> Double {
        
        return menu.values.max() ?? 0.0
    }
    
    func getLowestPrice() -> Double {
        var lowest = Double.greatestFiniteMagnitude
        for item in sortedMenu{
            if item.price < lowest{
                lowest = item.price
            }
        }
        return lowest
    }
    

    var body: some View {
        
       
        VStack {
            
            VStack{
                
                Image("3140")
                    .resizable()
                    .scaledToFit()
                    .frame(height:50)
                Text("Today's menu")
                    .font(.title2)
                    .bold()
                    .padding()
            }
            VStack{
                Toggle("Show welcome message", isOn: $showMessage)
                Toggle("Show only value menu", isOn: $showAffordableItems)
                    
                Toggle("Show premium items only", isOn: $showPremium)
            }
            .padding()
            
            if showMessage{
                Text("Welcome to the Quikees Family!")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding(.horizontal)
            }
            
            Button("View Desserts"){
                showDessert = true
            }
                .foregroundColor(.black)
                .sheet(isPresented: $showDessert){}
                .padding()
                .background(Color.purple.opacity(0.2))
            
            
            Divider()
            List{
                ForEach(displayMenu, id: \.name){
                    item in
                    MenuItemRowView(name:item.name, price:item.price)
                    
                
                    
                }
                
            }
            HStack{
                
                HStack{
                    Text("Premium: \(totalNumberOfPremuimItems)")
                        .font(.footnote)
                        .bold()
                        
                }
                Divider()
                HStack{
                    Text("Afforable: \(totalNumberOfAffordable)")
                        .font(.footnote)
                        .bold()
                        
                }
                Divider()
                HStack{
                    Text("Total: \(self.priceFormatter(self.totalPriceOfVisibileItems))")
                        .font(.footnote)
                        .bold()
                }
                
            
            }.frame(height: 20)
                
            Divider()
            Section{
                GroupBox{
                    DisclosureGroup("Menu Information", isExpanded: $isExpand){
                        VStack{
                            Text("Total Items: \(self.getTotalItem())").tag(1)
                        }
                        VStack{
                            Text("Highest: \(self.priceFormatter(self.getHighestPrice()))").tag(2)
                        }
                        VStack{
                            Text("Lowest: \(self.priceFormatter(self.getLowestPrice()))").tag(3)
                        }
                        VStack{
                            Text("Average: \(self.priceFormatter(self.averagePrice))").tag(4)
                        }
                    }
                }
                               
            }
        }}
}

#Preview {
    MenuView()
}
