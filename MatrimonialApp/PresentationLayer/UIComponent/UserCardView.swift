//
//  UserCardView.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

struct UserCardView: View {
  
  let user: UserData
  var acceptTapped: (() -> Void)?
  var declineTapped: (() -> Void)?
  
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: user.picture.large)) { phase in
        switch phase {
        case .empty:
          Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(.gray)
          
        case .success(let image):
          image
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
          
        case .failure(_):
          Image(systemName: "person.crop.circle.badge.exclamationmark")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundColor(.red)
          
        @unknown default:
          EmptyView()
        }
      }
      
      VStack(alignment: .leading, spacing: 8) {
        Text("\(user.name.title) \(user.name.first) \(user.name.last)")
          .font(.headline)
        Text("\(user.dob.age) \(user.gender)")
          .font(.subheadline)
        Text("\(user.location.city), \(user.location.country)")
          .font(.subheadline)
          .foregroundColor(.secondary)
        Text(user.phone)
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      
      if acceptTapped != nil, declineTapped != nil {
        HStack(spacing: 20) {
          Button(action: {
            declineTapped?()
          }) {
            Text("Decline")
              .foregroundColor(.red)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.red.opacity(0.1))
              .cornerRadius(10)
          }
          
          Button(action: {
            acceptTapped?()
          }) {
            Text("Accept")
              .foregroundColor(.green)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.green.opacity(0.1))
              .cornerRadius(10)
          }
        }
        .padding(.horizontal)
        .padding(.bottom)
      }
    }
    .background(Color(.systemBackground))
    .cornerRadius(15)
    .shadow(radius: 5)
  }
  
}
