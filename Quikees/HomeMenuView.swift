//
//  HomeMenuView.swift
//  Quikees
//
//  Created by Naqui Darby on 1/22/26.
//

import SwiftUI

struct HomeMenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink("Menu"){
                    MenuView()
                }
                NavigationLink("Reservation form"){
                    ReservationForm()
                }
                NavigationLink("Customer Profiles"){
                    CustomerView()
                }
            }
        }
    }
}

#Preview {
    HomeMenuView()
}
