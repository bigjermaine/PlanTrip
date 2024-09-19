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
    var body: some View {
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
          selectedOption: self.$birthMonth,
          placeholder: "Select your travle style",
          options: DropdownMenuOption.testAllMonths)
          tripDescription
              .padding(.horizontal)
          }

        }
        .frame(maxWidth:.infinity, alignment: .leading)

      }

    }
}

#Preview {
    CreateTripView()
}



extension CreateTripView {
  var topView: some View {
    HStack{
      Image("profile")
      Spacer()
      Button{

      }label: {
        Text("X")
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

      TextField("Enter the trip name", text: $tripText)
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

      TextField("Tell us more about the trip", text: $tripText)
      .multilineTextAlignment(.leading)
      .font(.satoshiMedium(size: 14))
       .frame(height:200)
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

  private func travelTextViewBorder() -> some View {
      RoundedRectangle(cornerRadius: 4, style: .continuous) .stroke(isTravelTextFieldFocused ? Color.blue : Color.clear, lineWidth: 1)
      .focused($isTravelTextFieldFocused)
  }
  private func textViewBorder() -> some View {
      RoundedRectangle(cornerRadius: 4, style: .continuous) .stroke(isTripTextFieldFocused ? Color.blue : Color.grayText, lineWidth: 1)
      .focused($isTripTextFieldFocused)
  }
}
