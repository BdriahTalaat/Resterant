//
//  NavigationBar.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        
        HStack{
            Image(systemName: "line.3.horizontal")
                .font(.title)
            Spacer()
            Image("Logo")
            Spacer()
            Image("Delivery van")
                .resizable()
                .frame(width: 40,height: 30)
                .scaledToFit()
        }
        .padding(.horizontal)
        .frame(height: 50)
        .frame(maxHeight: .infinity,alignment: .top)
    }
}

#Preview {
    NavigationBar()
}
