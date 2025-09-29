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
  @Published var refreshID = UUID()
  
  init() {
    fetchNewSearches()
  }
  
  func fetchNewSearches() {
   Task {
      do {
        let result = try await APIManager.shared.fetchUsers().results
        // Repeating for some dummy data
        var dummyResponse: [UserData] = []
        for _ in 0..<5 {
          dummyResponse.append(contentsOf: result)
        }
        withAnimation {
          self.users = dummyResponse
          self.refreshID = UUID()
          self.isLoading = false
        }
      } catch {
        self.errorMessage = "Failed to fetch bookmarks: \(error.localizedDescription)"
      }
    }
  }
  
  func acceptedTapped(userData: UserData, matchStatus: MatchStatus) {
    var data = userData
    data.matchStatus = matchStatus
    CoreDataManager.shared.storeNewUser(data)
    users.removeAll()
    fetchNewSearches()
  }
  
}
