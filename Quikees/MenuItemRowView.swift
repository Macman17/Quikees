//
//  MenuItemRowView.swift
//  Quikees
//
//  Created by Naqui Darby on 1/20/26.
//

import SwiftUI

struct MenuItemRowView: View {
    let name: String
    let price: Double
    var body: some View {
        HStack{
            
            Text(name)
                .font(.headline)
            Spacer()
            Text("$\(price, specifier: "%.2f")")
                .foregroundColor(.secondary)
            
            if price > 10 {
                PremiumView()
            }
        }
    }
}

//#Preview {
 //   MenuItemRowView()
//}
