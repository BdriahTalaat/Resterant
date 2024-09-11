//
//  OrderView.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//

import SwiftUI

struct OrderView: View {
    var categories = ["Starters", "Desserts", "Drinks", "Specials"]
   
    var body: some View {
        VStack (alignment: .leading,spacing: 20){
            
            Text("Order FOR DELIVERY!".uppercased())
                .font(.system(size: 20,weight: .bold))
                
            ScrollView(.horizontal,showsIndicators: false) {
                HStack (spacing: 20){
                    ForEach(categories, id: \.self) { item in
                        Text(item)
                            .padding(5)
                            .padding(.horizontal,9)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(5)
                    }
                    
                }
            }
        }
        .frame(height: 100)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OrderView()
}
