//
//  HomeNavView.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//

import SwiftUI

struct HomeNavView: View {
  @State private var searchString: String = ""
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Button(action: {
        }) {
          Image(systemName: "circle.grid.2x2.fill")
            .foregroundStyle(.gray)
            .frame(width: 25, height: 30)
        }
        .buttonBorderShape(.roundedRectangle(radius: 15))
        .buttonStyle(.borderedProminent)
        .tint(.gray.opacity(0.1))
        
        Spacer()
        
        Image("profpic")
          .resizable()
          .frame(width: 40, height: 40)
          .clipShape(RoundedRectangle(cornerRadius: 15))
          .shadow(color: .gray, radius: 3)
      }
      
      Text("Find the best for you")
        .font(.sourcesans(fontStyle: .largeTitle, fontWeight: .bold))
        .foregroundStyle(.black)
      
      HStack {
        Image(systemName: "magnifyingglass")
          .foregroundStyle(.gray)
        
        TextField("Let me help you...", text: $searchString)
          .font(.sourcesans(fontStyle: .headline))
      }
      .padding()
      .background(Color.gray.opacity(0.1))
      .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    .padding(.all)
    .background(Color.white)
  }
}

#Preview {
  HomeNavView()
}
