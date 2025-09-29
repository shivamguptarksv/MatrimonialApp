//
//  UserModel.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

enum MatchStatus: String, Codable {
  case pending = "Pending"
  case accepted = "Accepted"
  case declined = "Declined"
}

struct UserResponse: Codable {
  let results: [UserData]
  let info: Info
}

// MARK: - UserData

struct UserData: Codable {
  let gender: String
  let name: Name
  let location: Location
  let email: String
  let login: Login
  let dob: DateInfo
  let registered: DateInfo
  let phone: String
  let cell: String
  let id: UserId
  let picture: Picture
  let nat: String
  var matchStatus: MatchStatus = .pending
  
  enum CodingKeys: String, CodingKey {
      case gender, name, location, email, login, dob, registered, phone, cell, id, picture, nat
  }
}

// MARK: - Name
struct Name: Codable {
  let title: String
  let first: String
  let last: String
}

// MARK: - Location
struct Location: Codable {
  let street: Street
  let city: String
  let state: String
  let country: String
  let postcode: Int
  let coordinates: Coordinates
  let timezone: TimeZoneInfo
}

struct Street: Codable {
  let number: Int
  let name: String
}

struct Coordinates: Codable {
  let latitude: String
  let longitude: String
}

struct TimeZoneInfo: Codable {
  let offset: String
  let description: String
}

// MARK: - Login

struct Login: Codable {
  let uuid: String
  let username: String
  let password: String
  let salt: String
  let md5: String
  let sha1: String
  let sha256: String
}

// MARK: - DateInfo

struct DateInfo: Codable {
  let date: String
  let age: Int
}

// MARK: - ID

struct UserId: Codable {
  let name: String
  let value: String?
}

// MARK: - Picture

struct Picture: Codable {
  let large: String
  let medium: String
  let thumbnail: String
}

// MARK: - Info

struct Info: Codable {
  let seed: String
  let results: Int
  let page: Int
  let version: String
}
