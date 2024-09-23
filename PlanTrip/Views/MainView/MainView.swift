//
//  MainView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 21/09/2024.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject private var nav:MoreNavigationManager
  @EnvironmentObject private var coreDataManager:CoreDataManager
  @EnvironmentObject private var setupViewModel :SetupViewModel
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
      if !coreDataManager.savedEntity.isEmpty {
        List{
          ForEach(coreDataManager.savedEntity) { x  in
            MainCell(trip:x) {
              nav.loadView(.Details(x))

            }
          }
          .onDelete(perform: coreDataManager.delete)
          .listRowSeparator(.hidden)

        }

        .listStyle(.plain)
      }else {
        Text("No city Found Try Again Later")
          .multilineTextAlignment(.center)
          .font(.satoshiMedium(size: 20))
          .foregroundColor(.grayText)
        Spacer()
      }

    }
    .navigationBarBackButtonHidden()
    .frame(maxWidth: .infinity,maxHeight: .infinity)
    .onAppear{
      coreDataManager.fetchTrips()
    }

  }

}

#Preview {
    MainView()
}

extension MainView {

}


import SwiftUI

struct MainCell: View {
    var trip: Trip
    var onViewButtonTapped: () -> Void
    @State private var daysLeft: Int? // Use @State to manage the state of days left

    var body: some View {
        VStack {
            VStack {
                Image("parisImage")
                    .resizable()
                    .frame(height: 230)

                VStack(alignment: .leading, spacing: 8) {
                    Text(trip.tripName ?? "")
                        .font(.satoshiBold(size: 16))
                        .foregroundColor(.grayText)

                    HStack {
                        Text(trip.startDate ?? "")
                            .font(.satoshiMedium(size: 14))
                            .foregroundColor(.grayText)
                        Spacer()
                        // Display daysLeft or a default message if nil
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
            calculateDaysLeft() // Calculate days left when the view appears
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
                daysLeft = daysLeftValue // Set the state variable
            }
        } else {
            daysLeft = nil // Handle invalid format if needed
        }
    }

    private func textViewBorder() -> some View {
        RoundedRectangle(cornerRadius: 4, style: .continuous)
            .stroke(Color.closeWhite, lineWidth: 1)
    }
}
