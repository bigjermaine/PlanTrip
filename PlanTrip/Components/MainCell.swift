//
//  MainCell.swift
//  PlanTrip
//
//  Created by MacBook AIR on 23/09/2024.
//

import Foundation
import SwiftUI
struct MainCell: View {
  var trip: Trip
  var onViewButtonTapped: () -> Void
  @State private var daysLeft: Int?

  var body: some View {
    VStack {
      VStack {
        ZStack {
          Image("parisImage")
            .resizable()
            .frame(height: 230)

          Button(action: {
            print("Click Me tapped")
            // Add your action here
          }) {
            VStack(alignment: .trailing){
              HStack{
                Spacer()
                Text(trip.city ?? "")
                  .font(.satoshiMedium(size: 14))
                  .foregroundColor(.white)
                  .padding(8)
                  .background(Color.gray.opacity(0.7))
                  .cornerRadius(4)
              }
              .padding(.trailing, 16)
              .padding(.top, 16)

            }
            Spacer()
          }
          .frame(alignment: .topTrailing)
        }

        VStack(alignment: .leading, spacing: 8) {
          Text(trip.tripName ?? "")
            .font(.satoshiBold(size: 16))
            .foregroundColor(.grayText)

          HStack {
            Text(trip.startDate ?? "")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.grayText)
            Spacer()

            Text("\(daysLeft ?? 0) days left")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.ash)
          }

          Button(action: onViewButtonTapped) {
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
      .background(
        RoundedRectangle(cornerRadius: 4)
          .fill(Color.white)
      )
      .overlay(textViewBorder())
    }
    .onAppear {
      calculateDaysLeft()
    }
  }

  private func calculateDaysLeft() {
    guard let startDateString = trip.startDate,
          let endDateString = trip.endDate else { return }

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d MMMM yyyy" // Adjust based on your date format

    if let startDate = dateFormatter.date(from: startDateString),
       let endDate = dateFormatter.date(from: endDateString) {

      let calendar = Calendar.current
      let components = calendar.dateComponents([.day], from: startDate, to: endDate)

      if let daysLeftValue = components.day {
        daysLeft = daysLeftValue
      }
    } else {
      daysLeft = nil
    }
  }

  private func textViewBorder() -> some View {
    RoundedRectangle(cornerRadius: 4, style: .continuous)
      .stroke(Color.closeWhite, lineWidth: 1)
  }
}
