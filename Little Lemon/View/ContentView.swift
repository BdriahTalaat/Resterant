//
//  ContentView.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//


import SwiftUI

struct ContentView: View {
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
        
    var body: some View {
        NavigationView {
            if isLoggedIn {
                MenuView()
            } else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    ContentView()
}
