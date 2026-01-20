//
//  DessertMenu.swift
//  Quikees
//
//  Created by Naqui Darby on 1/17/26.
//

import SwiftUI

struct DessertMenu: View {
    
    @State private var showMessage = false
    @State private var showAffordableItems = false
    @State private var selectedOption = "Option 1"
  
    @State private var isExpand = false
    
    let desserts: [String: Double] = [
     
        "Chocalate Chip Cookies": 2.99,
        "Peacan Pie": 5.99,
        "Chocolate Lava Cake": 4.99,
        "Strawberry Shortcake": 3.99,
        "Apple Pie": 3.99
    ]
    
    var sortedMenu: [(name: String, price: Double)] {
        desserts
            .sorted {$0.key < $1.key}
            .map{ (name: $0.key, price: $0.value) }
    }
    
    var displayMenu: [(name: String, price: Double)] {
        if showAffordableItems {
            return sortedMenu.filter { $0.price < 10}
        }else {
            return sortedMenu
        }
        
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
        
        return desserts.count
    }
    
    func getHighestPrice() -> Double {
        
        return desserts.values.max() ?? 0.0
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
                Text("Dessert Menu")
                    .font(.title2)
                    .bold()
                    .padding()
            }
            
            .padding()
            
            Divider()
            List{
                ForEach(displayMenu, id: \.name){
                    name, price in
                    
                    HStack{
                        Text("\(name)")
                        Spacer()
                        Text("\(self.priceFormatter(price))")
                            .foregroundColor(.secondary)
                        
                    }
                    
                }
                
            }
            
            Section{
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
            }
        }
    }
}

#Preview {
    DessertMenu()
}
