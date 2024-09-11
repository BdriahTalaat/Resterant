//
//  HomeView.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
           
            TabView {
               
                // New Menu tab
                MenuView()
                    .tabItem { Label("Menu", systemImage: "list.dash")}
                
                
                UserProfileView()
                    .tabItem { Label("Profile", systemImage: "square.and.pencil") }
                
                
                
                    

            }
            .background(.ultraThinMaterial)
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
    }
}

#Preview {
    HomeView()
}
