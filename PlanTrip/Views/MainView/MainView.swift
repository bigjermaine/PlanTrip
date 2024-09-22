//
//  MainView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 21/09/2024.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject private var nav:MoreNavigationManager
  var body: some View {
    VStack(alignment:.leading){
      Text("Your Trips")
        .font(.satoshiBold(size: 16))
        .padding(.horizontal)
        .foregroundColor(.grayText)
      Text("Your trip itineraries and  planned trips are placed here")
        .font(.satoshiMedium(size: 14))
        .padding(.horizontal)
        .foregroundColor(.grayText)
      HStack{
        HStack{
          Text("Planned Trips")
            .font(.satoshiBold(size: 14))
            .padding(.leading)
          Spacer()
          Image(systemName: "chevron.down")
            .padding(.trailing)
        }
        .frame(maxWidth: .infinity,maxHeight: 38)
        .background(Color.white)
        .cornerRadius(4)
        .padding(.horizontal)
      }
      .frame(maxWidth: .infinity,maxHeight: 54)
      .background(Color.closeWhite)
      .cornerRadius(4)
      .padding(.horizontal)
      List{
        ForEach(0..<2) { _ in
          MainCell
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)

    }
    .navigationBarBackButtonHidden()
    .frame(maxWidth: .infinity,maxHeight: .infinity)

  }
}

#Preview {
    MainView()
}

extension MainView {
  var MainCell: some View {
    VStack{
      VStack{
       Image("parisImage")
          .resizable()
          .frame(height: 230)
        VStack(alignment:.leading,spacing: 8){
          Text("Bahamas Family Trip")
            .font(.satoshiBold(size: 16))
            .foregroundColor(.grayText)
          HStack{
            Text("19th April 2024")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.grayText)
            Spacer()
            Text("5 Days")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.ash)
          }
          Button {
            nav.loadView(.Details)
          } label: {
            Text("View")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.white)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.systemBlue)
              .cornerRadius(4)
          }
        }

      }
      .padding()
    }
    .background(
        RoundedRectangle(cornerRadius: 4)
          .fill(Color.white)

      )
     .overlay(textViewBorder())

  }
  private func textViewBorder() -> some View {
    RoundedRectangle(cornerRadius: 4, style: .continuous) .stroke( Color.closeWhite, lineWidth: 1)

  }

}
