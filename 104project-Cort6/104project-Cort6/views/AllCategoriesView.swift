//
//  AllCategoriesView.swift
//  104project-Cort6
//
//  Created by Naqui Darby on 2/10/26.
//

import SwiftUI

struct AllCategoriesView: View {
    var body: some View {
        
        VStack{
            
            Image(systemName: "progress.indicator")
                .font(.largeTitle)
            
            Text("All Categories")
                .font(.largeTitle.bold())
            
            Text("Under Construction...")
                .foregroundStyle(Color.gray)
            
        }
        .navigationTitle("All Cateories")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    AllCategoriesView()
}
