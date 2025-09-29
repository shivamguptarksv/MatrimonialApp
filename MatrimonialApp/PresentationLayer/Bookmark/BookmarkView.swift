//
//  BookmarkView.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

struct BookmarkView: View {
  
  var body: some View {
    NavigationView {
      VStack {
        Text("Bookmark")
          .font(.title)
        Text("Bookmark functionality will appear here.")
          .foregroundColor(.secondary)
          .padding()
      }
      .frame(height: 300)
      .navigationTitle("Bookmark")
    }
    .onAppear {
      getData()
    }
  }
  
  func getData() {
    Task {
      do {
        let result = try await APIManager.shared.fetchUsers()
        debugPrint("Result: \(result)")
      } catch {
        debugPrint("Error fetching users: \(error.localizedDescription)")
      }
    }
  }
}

#Preview {
  BookmarkView()
}
