//
//  SearchViewModel.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

@MainActor
class SearchViewModel: ObservableObject {
  
  @Published var users: [UserData] = []
  @Published var isLoading: Bool = false
  @Published var errorMessage: String?
  
  init() {
    fetchBookmarks()
  }
  
  func fetchBookmarks() {
   Task {
      do {
        let result = try await APIManager.shared.fetchUsers().results
        // Repeating for some dummy data
        var dummyResponse: [UserData] = []
        for _ in 0..<5 {
          dummyResponse.append(contentsOf: result)
        }
        self.users = dummyResponse
        self.isLoading = false
      } catch {
        self.errorMessage = "Failed to fetch bookmarks: \(error.localizedDescription)"
      }
    }
  }
  
  func acceptedTapped() {
    // TODO:
  }
  
  func declinedTapped() {
    // TODO:
  }
  
}
