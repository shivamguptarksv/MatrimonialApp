//
//  HomeView.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

struct HomeView: View {
  
  @State private var searchText = ""
  @StateObject private var viewModel = HomeViewModel()
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        HomeNavView()
        ScrollView {
          VStack(alignment: .leading, spacing: 20) {
            Text("My Watchlist")
              .font(.title2)
              .fontWeight(.bold)
              .padding(.horizontal)
            
            ForEach(viewModel.users.indices, id: \.self) { index in
              let user = viewModel.users[index]
                            
              UserCardView(user: user, buttonTapped: nil)
                .padding(.horizontal)
            }
            
          }
          .padding(.top)
          .padding(.bottom)
        }
      }
      .navigationBarHidden(true)
      .background(Color.white.ignoresSafeArea())
      .onAppear {
        viewModel.fetchConnectionList()
      }
    }
  }
  
}

#Preview {
  HomeView()
}
