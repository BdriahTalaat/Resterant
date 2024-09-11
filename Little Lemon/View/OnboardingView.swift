//
//  OnboardingView.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//

import SwiftUI


// Global constants for UserDefaults keys
let kFirstName = "userFirstNameKey"
let kLastName = "userLastNameKey"
let kEmail = "userEmailKey"
let kIsLoggedIn = "kIsLoggedIn"

struct OnboardingView: View {
    
    enum Field:Hashable{
        case fristName
        case lastName
        case email
        
    }
    @State var fristName = ""
    @State var lastName = ""
    @State var email = ""
    @FocusState var focusField:Field?
    @State var showAlert = false
    @State var alertMessage = ""
    @State var isLoggedIn = false
    
    
    var body: some View {
        
        NavigationView {
           
            ZStack {
                
                Image("background")
                    .resizable() // Make the image resizable
                    .aspectRatio(contentMode: .fill) // Adjust the aspect ratio
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment:.leading, spacing:20){
                    
                    
                    Text("Sign Up")
                        .font(.largeTitle.bold())
                        
                    
                    TextField("Type Your First name", text: $fristName)
                        .inputStyle(icon: "mail")
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusField,equals: .fristName)
                        .shadow(color: focusField == .fristName ? .primary.opacity(0.3) : .clear, radius: 10 ,x:0 ,y:3)
                    
                    TextField("Type Your Last name", text: $lastName)
                        .inputStyle(icon: "mail")
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($focusField,equals: .lastName)
                        .shadow(color: focusField == .lastName ? .primary.opacity(0.3) : .clear, radius: 10 ,x:0 ,y:3)
                    
                    TextField("Type Your Email", text: $email)
                        .inputStyle(icon: "mail")
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .focused($focusField,equals: .email)
                        .shadow(color: focusField == .email ? .primary.opacity(0.3) : .clear, radius: 10 ,x:0 ,y:3)
                    
                    
                    // NavigationLink to HomeView
                        NavigationLink(
                            destination: HomeView(),
                            isActive: $isLoggedIn,
                            label: {
                              //  EmptyView()
                                
                            }
                        )
                    
                    
                    Button{
                        
                        if !fristName.isEmpty && !lastName.isEmpty  && !email.isEmpty {
                            
                            UserDefaults.standard.set(fristName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            
                            alertMessage = "User registered successfully!"
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                           
                            fristName = ""
                            lastName = ""
                            email = ""
                            
                        }else{
                            
                            alertMessage = "Please fill in all fields."
                            fristName = ""
                            lastName = ""
                            email = ""
                            
                        }
                        
                        showAlert = true
                        
                    }label: {
                        Text("Register")
                            
                            .frame(maxWidth: .infinity)
                            
                    }
                    .font(.headline)
                    .buttonStyle(.angular)
                    .tint(.accentColor)
                    .controlSize(.large)
                    .shadow(color: Color("shadow").opacity(0.2),radius: 30,x: 0,y: 30)
                    
                }
                .padding()
                .frame(height: 400)
                .background(.ultraThinMaterial ,in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .padding()
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK")){
                        
                        if !fristName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                            isLoggedIn = true
                        }
                    })
                }
            }
            .navigationTitle("")
            
            
        }.onAppear{
            
            if UserDefaults.standard.bool(forKey:kIsLoggedIn){
                isLoggedIn = true
            }
        }
        
    }
}

#Preview {
    OnboardingView()
}
