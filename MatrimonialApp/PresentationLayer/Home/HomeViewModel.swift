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
  var cachedData = [UserItem]()
  @Published var isLoading: Bool = false
  @Published var errorMessage: String?
  
  init() {
    fetchConnectionList()
  }
  
  func fetchConnectionList() {
    isLoading = true
    errorMessage = nil
    self.cachedData = try! CoreDataManager.shared.fetchUsers()
    let data: [UserData] = cachedData.compactMap { userItem in
      guard let userData = userItem.userData,
            let dataDecoded = try? JSONDecoder().decode(UserData.self, from: userData) else {
            return nil
        }
        return dataDecoded
    }
    self.users = data
  }
  
}
