//
//  CreateTripView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import SwiftUI

struct CreateTripView: View {
  @FocusState private var isTripTextFieldFocused: Bool
  @FocusState private var isTravelTextFieldFocused: Bool
  @State private var tripText = ""
  @State private var birthMonth: DropdownMenuOption? = nil
  @EnvironmentObject private var setupViewModel :SetupViewModel
  @State private var showAlertView: Bool = false
  @EnvironmentObject private var nav:MoreNavigationManager
  @EnvironmentObject  private var coreDataManager:CoreDataManager
  @Binding  var toogleButtonSheet:Bool
    var body: some View {
      ScrollView{
        VStack(spacing:20){
          topView
            .padding(.horizontal)
          VStack(alignment:.leading,spacing: 20){
            VStack(alignment:.leading){
              Text("Create a Trip")
                .font(.satoshiBold(size: 14))
                .foregroundColor(.blackText)
              Text("Let's Go! Build Your Next Adventure")
                .font(.satoshiBold(size: 12))
                .foregroundColor(.grayText)
            }
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(.horizontal)
            VStack(spacing:20){
              tripView
                .padding(.horizontal)
              travelStyleView
                .padding(.horizontal)
              DropdownMenu(
                selectedOption: $setupViewModel.tripStyle,
                placeholder: "Select your travle style",
                options: setupViewModel.tripStyles)
                tripDescription
                .padding(.horizontal)
            }

            Button(action: {
              setupViewModel.tripSetup()
              if   setupViewModel.tripCreateDisabled {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                  coreDataManager.addTrip(name: setupViewModel.tripName, style: setupViewModel.tripStyle?.option, description: setupViewModel.tripDescription, city: setupViewModel.cityName, start: setupViewModel.startDate, end: setupViewModel.endDate)
                  toogleButtonSheet = false
                  nav.loadView(.main)
                }
              }else {
                showAlertView = true

              }
            }) {
                Text("Next")
                     .font(.satoshiBold(size: 14))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(4)

            }
            .padding(.horizontal)



          }
          .frame(maxWidth:.infinity, alignment: .leading)

        }
        .padding(.top,40)
        .alert(isPresented:$showAlertView) {
          Alert(title: Text("Alert"),message:Text(setupViewModel.error ?? ""), dismissButton: .cancel())
        }
        .onAppear{
          Task{
            await setupViewModel.fetchOptions()
          }
        }
      }
    }
}

#Preview {
  CreateTripView(toogleButtonSheet:.constant(false))
}



extension CreateTripView {
  var topView: some View {
    HStack{
      Image("profile")
      Spacer()
      Button{
       toogleButtonSheet = false
      }label: {
          Image(systemName:"xmark")
          .font(.satoshiBold(size: 20))
          .foregroundColor(.blackText)
      }
    }

  }

  var tripView: some View {
    VStack(alignment:.leading){
      Text("Trip Name")
        .font(.satoshiMedium(size: 14))
        .foregroundColor(.blackText)

      TextField("Enter the trip name", text: $setupViewModel.tripName)
       .frame(height: 50)
       .font(.satoshiMedium(size: 14))
       .padding(5)
       .background(
           RoundedRectangle(cornerRadius: 4)
            .fill(Color.white)
         )
        .overlay(textViewBorder())
        .focused($isTripTextFieldFocused)
    }
    .frame(maxWidth:.infinity, alignment: .leading)
  }


  var travelStyleView: some View {
    VStack(alignment:.leading){
      Text("Travel Style")
        .font(.satoshiMedium(size: 14))
        .foregroundColor(.blackText)
    }
    .frame(maxWidth:.infinity, alignment: .leading)
  }


  var tripDescription: some View {
    VStack(alignment:.leading){
      Text("Trip Description")
        .font(.satoshiMedium(size: 14))
        .foregroundColor(.blackText)

      TextField("Tell us more about the trip", text: $setupViewModel.tripDescription)
      .multilineTextAlignment(.leading)
      .font(.satoshiMedium(size: 14))
       .frame(height:200)
       .padding(5)
       .background(
           RoundedRectangle(cornerRadius: 4)
            .fill(Color.white)
         )
        .overlay(travelTextViewBorder())
        .focused($isTravelTextFieldFocused)
    }
    .frame(maxWidth:.infinity, alignment: .leading)
  }

  private func travelTextViewBorder() -> some View {
      RoundedRectangle(cornerRadius: 4, style: .continuous) .stroke(isTravelTextFieldFocused ? Color.blue : Color.grayText, lineWidth: 1)
      .focused($isTravelTextFieldFocused)
  }
  private func textViewBorder() -> some View {
      RoundedRectangle(cornerRadius: 4, style: .continuous) .stroke(isTripTextFieldFocused ? Color.blue : Color.grayText, lineWidth: 1)
      .focused($isTripTextFieldFocused)
  }
}
