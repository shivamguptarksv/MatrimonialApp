//
//  BookmarkViewModel.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

class BookmarkViewModel: ObservableObject {
  
  @Published var users: [UserData] = []
  @Published var isLoading: Bool = false
  @Published var errorMessage: String?

  func fetchBookmarks() {
    isLoading = true
    errorMessage = nil
    
    Task {
      do {
        let result = try await APIManager.shared.fetchUsers()
        DispatchQueue.main.async {
          self.users = result.results
          self.isLoading = false
        }
      } catch {
        DispatchQueue.main.async {
          self.errorMessage = "Failed to fetch bookmarks: \(error.localizedDescription)"
          self.isLoading = false
        }
      }
    }
  }
  
}
