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
  @State private var showAlertView: Bool = false
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
        .onTapGesture {
          showAlertView = true
          HapticManager.shared.vibrate(for: .warning)
        }
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
        Text("No Trips Found")
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
    .alert(isPresented:$showAlertView) {
      Alert(title: Text("Alert"),message:Text("Subcribe To Get Multi Trips Creation Or Reach To Me @danieljermaine97@gmail.com "), dismissButton: .cancel())
    }

  }

}

#Preview {
    MainView()
}

extension MainView {

}



