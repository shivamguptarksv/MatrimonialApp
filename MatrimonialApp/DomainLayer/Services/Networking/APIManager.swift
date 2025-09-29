//
//  APIManager.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import Foundation

final class APIManager {
  
  static let shared = APIManager()
  
  private let session: URLSession
  private let decoder: JSONDecoder
  private let baseURL = "https://randomuser.me/api/?results=10%60"

  private init() {
    let cache = URLCache(memoryCapacity: 50 * 1024 * 1024,
                         diskCapacity: 100 * 1024 * 1024,
                         diskPath: "imageCache")
    let config = URLSessionConfiguration.default
    config.urlCache = cache
    config.requestCachePolicy = .returnCacheDataElseLoad
    self.session = URLSession(configuration: config)

    self.decoder = JSONDecoder()

  }
 
  func fetchUsers() async throws -> UserResponse {
    guard let url = URL(string: baseURL) else {
      fatalError("Url invalid")
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
      fatalError("HttpResponse mispatching")
    }
    return try JSONDecoder().decode(UserResponse.self, from: data)
  }
  
  
}
