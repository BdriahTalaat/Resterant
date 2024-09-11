//
//  MenuView.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//

import SwiftUI

struct MenuView: View {
    

    var body: some View {
        
        VStack{
            NavigationBar()
                .frame(height: 50,alignment: .top)
            
            VStack (alignment: .leading ,spacing: 15){
                Text("Little Lemon")
                    .font(.system(size: 50,weight: .bold))
                    .foregroundStyle(Color("Yallow"))
                
                Text("Chicago")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
                
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                
                    .foregroundStyle(Color.white)
                
                Button{
                    
                    
                }label: {
                   Text("Reserve a table")
                        .padding(.horizontal)
                        .padding(.vertical)
                        .foregroundStyle(Color.black)
                        .background(Color("Yallow"))
                        .cornerRadius(10)
                        
                }
            }
            
            .frame(maxWidth: .infinity,alignment: .top)
            .frame(height: 300)
            .padding(.horizontal,5)
            .background(Color("Green"))
            
            OrderView()
            MenuComponent()
        }
        
        
        
    }
}

#Preview {
    MenuView()
}
