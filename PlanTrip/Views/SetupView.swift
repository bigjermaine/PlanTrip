//
//  SetupView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import SwiftUI

struct SetupView: View {
  @StateObject private var nav = MoreNavigationManager()
  @State private var toogleButtonSheet:Bool = false
  @StateObject private var setupViewModel = SetupViewModel()
  @State private var showAlertView: Bool = false
  var body: some View {
    NavigationStack(path: $nav.path) {
      ZStack{
        Color.ash.ignoresSafeArea()
        VStack{
          topView
          Spacer()
          middleView
          Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding(.horizontal)
      }
      .frame(maxWidth: .infinity,maxHeight: .infinity)
      .navigationDestination(for: MoreNavigationManager.Navigations.self) { route in
        switch route {
        case .Date:
          DatePickerView()
            .environmentObject(nav)
            .environmentObject(setupViewModel)
        case.search:
          SearchCountryView()
            .environmentObject(nav)
            .environmentObject(setupViewModel)
        case.main:
          MainView()
            .environmentObject(nav)
            .environmentObject(setupViewModel)
        case.Details:
          ContentView()
            .environmentObject(nav)
            .environmentObject(setupViewModel)
    
        }
      }
    }
    .alert(isPresented:$showAlertView) {
      Alert(title: Text("Alert"),message:Text(setupViewModel.error ?? ""), dismissButton: .cancel())
    }
    .sheet(isPresented: $toogleButtonSheet, content: {
      CreateTripView(toogleButtonSheet: $toogleButtonSheet)
        .environmentObject(nav)
        .environmentObject(setupViewModel)
    })

  }
}

#Preview {
    SetupView()
}


extension SetupView {
  var middleView: some View {
    VStack{
      selectCityButton
      HStack{
        startCalenderButton
        endCalenderButton

      }
      createATripButton
    }
    .frame(maxWidth: .infinity,maxHeight:300)
    .background(Color.white)
    .cornerRadius(4)
    .padding()
  }
  var topView: some View {
    VStack(alignment: .leading){
     Text("Plan Your Dream Trip in Minutes")
        .font(.satoshiBold(size: 18))
        .foregroundColor(.blackText)
      Text("Build, personalize, and optimize your itineraries with our trip planner. Perfect for getaways, remote workcations, and any spontaneous escapade.")
        .foregroundColor(.grayText)
        .font(.satoshiMedium(size: 14))
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  var selectCityButton: some View {
    HStack{
      Button{
        nav.loadView(.search)
      }label: {
        HStack{
          Image("MapPin")

          VStack(alignment:.leading){
            Text("Where to ?")
              .font(.satoshiMedium(size: 12))
            Text(setupViewModel.cityName ?? "Select City")
              .font(.satoshiBold(size: 14))
          }
          .foregroundColor(.grayText)
        }

      }
      .padding(.horizontal,8)
      Spacer()
    }
    .frame(maxWidth: .infinity,maxHeight:86)
    .background(Color(.closeWhite))
    .cornerRadius(4)
    .padding(.horizontal)

  }

  var startCalenderButton: some View {
    HStack{
      Button{
        nav.loadView(.Date)
      }label: {
        HStack{
          Image("CalendarBlank")
          VStack(alignment:.leading){
            Text("Start Date")
              .font(.satoshiMedium(size: 12))
            Text(setupViewModel.startDate ?? "Enter Date")
              .font(.satoshiBold(size: 14))
          }
          .foregroundColor(.grayText)
        }
      }
      .padding(.horizontal,8)

      Spacer()
    }
    .frame(maxWidth: .infinity,maxHeight:86)
    .background(Color(.closeWhite))
    .cornerRadius(4)
    .padding(.leading)

  }

  var endCalenderButton: some View {
    HStack{
      Button{
        nav.loadView(.Date)
      }label: {
        HStack{
          Image("CalendarBlank")
          VStack(alignment:.leading){
            Text("End Date")
              .font(.satoshiMedium(size: 12))
            Text(setupViewModel.endDate ?? "End Date")
              .font(.satoshiBold(size: 14))
          }
          .foregroundColor(.grayText)
        }
      }
      .padding(.horizontal,8)
      Spacer()
    }
    .frame(maxWidth: .infinity,maxHeight:86)
    .background(Color(.closeWhite))
    .cornerRadius(4)
    .padding(.trailing)

  }


  var createATripButton: some View {
    HStack{
      Button{
        setupViewModel.setUp()
        if setupViewModel.loginDisabled {
          toogleButtonSheet = true

        }else {
          showAlertView = true
        }

      }label: {
        HStack{
          Spacer()
           Text("Create a Trip")
            .font(.satoshiBold(size: 14))
            .foregroundColor(.white)
          Spacer()
        }
      }


      Spacer()
    }
    .frame(maxWidth: .infinity,maxHeight:62)
    .background(Color(.systemBlue))
    .cornerRadius(4)
    .padding(.horizontal)


  }

}
