//
//  HomeViewModel.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
  
  @Published var users: [UserData] = []
  @Published var isLoading: Bool = false
  @Published var errorMessage: String?
  
  init() {
    fetchBookmarks()
  }
  
  func fetchBookmarks() {
    isLoading = true
    errorMessage = nil
    
    Task {
      do {
        let result = try await APIManager.shared.fetchUsers()
        self.users = result.results
        self.isLoading = false
      } catch {
        self.errorMessage = "Failed to fetch bookmarks: \(error.localizedDescription)"
        self.isLoading = false
      }
    }
  }
}
