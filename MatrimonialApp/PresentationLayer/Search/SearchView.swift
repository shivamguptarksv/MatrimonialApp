//
//  SearchView.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

struct SearchView: View {
  
  @State private var searchText = ""
  @StateObject private var viewModel = SearchViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        TabView {
          ForEach(viewModel.users.indices, id: \.self) { index in
            let user = viewModel.users[index]
            
            UserCardView(user: user) { (user, status) in
              viewModel.acceptedTapped(userData: user, matchStatus: status)
            }
            .padding(.horizontal)
          }
          .frame(height: 300)
          Spacer()
        }
        .navigationTitle("Search")
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(.page(backgroundDisplayMode: .always))
      }
    }
  }
  
}

#Preview {
  SearchView()
}
