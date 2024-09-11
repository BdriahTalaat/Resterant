//
//  MenuComponent.swift
//  Little Lemon
//
//  Created by Bdriah Talaat on 08/03/1446 AH.
//


import SwiftUI
import Combine

struct MenuComponent: View {
    
    @StateObject private var viewModel = MenuViewModel()
    @State var error: Error?
    @State var menuData: Data?
    //var menuItems:[MenuItem] = []
    
    var body: some View {
        ScrollView(showsIndicators: false){
            
            ForEach(viewModel.menuItems, id: \.self) { item in
                HStack {
                    
                    // to use image as URL
                    AsyncImage(url: URL(string:item.image)) { phase in
                          
                        switch phase {
                        case .empty:
                            ProgressView() // Show a progress view while loading
                        case .success(let image):
                            image
                                .resizable()
                                //.scaledToFit()
                                .frame(width: 100,height: 100)
                                .cornerRadius(10)

                        case .failure:
                            Image(systemName: "exclamationmark.icloud") // Placeholder image in case of error
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    
                    VStack (alignment: .leading,spacing: 20){
                        Text(item.title)
                            .bold()
                        
                        Text(item.description)
                            .font(.footnote)
                        Text(item.price)
                            .font(.system(size: 12,weight: .bold))
                        
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                
            }
            
        }
        .onAppear{
            //fetchData()
            viewModel.fetchData()
        }

    }
    
}

class MenuViewModel: ObservableObject {
    @Published var menuItems: [MenuItem] = []


    func fetchData() {
        Menu.getMenuData { result in
            switch result {
            case .success(let menuResponse):
                // Handle the decoded MenuResponse object
                print("Fetched menu items: \(menuResponse.count)")
                self.menuItems = menuResponse
                
            case .failure(let error):
                // Handle the error
                print("Error fetching menu data: \(error)")
            }
        }
    }

}

#Preview {
    MenuComponent()
}
