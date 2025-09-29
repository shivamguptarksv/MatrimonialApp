//
//  BookmarkView.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

struct BookmarkView: View {
  
  @StateObject private var viewModel = BookmarkViewModel()

  var body: some View {
    NavigationView {
      VStack {
        Text("Bookmark")
          .font(.title)
      }
      .frame(height: 300)
      .navigationTitle("Bookmark")
    }
    .onAppear {
      viewModel.fetchBookmarks()
    }
  }
  
}

#Preview {
  BookmarkView()
}
