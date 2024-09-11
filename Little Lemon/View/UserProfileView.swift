//
//  UserProfileView.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//


import SwiftUI



struct UserProfileView: View {
    
    let firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? "First Name Not Found"
    let lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? "Last Name Not Found"
    let email: String = UserDefaults.standard.string(forKey: kEmail) ?? "Email Not Found"
    @Environment(\.presentationMode) var presentation // This will automatically reference the presentation environment in SwiftUI which will allow you to reach the navigation logic.

    
    
    var body: some View {
       
        VStack (spacing:30){
            Text("Personal information")
                .font(.largeTitle.bold())
            Image("Profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            
            Group {
                Text(firstName)
                Text(lastName)
                Text(email)
            }
            .font(.system(size: 20))
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
         
            
            
            Button{
                // Logout button action
                // Set UserDefaults to false for the logged-in key
                UserDefaults.standard.set(false, forKey: kIsLoggedIn )
                
                // Dismiss the current view
                self.presentation.wrappedValue.dismiss()
                
            }label: {
                Text("Log Out")
                    .padding()
                    .padding(.horizontal)
                    .foregroundStyle(Color.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfileView()
}

