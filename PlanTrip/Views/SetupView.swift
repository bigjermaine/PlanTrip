//
//  SetupView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import SwiftUI

struct SetupView: View {
    var body: some View {
      ZStack{
        Color.brown.ignoresSafeArea()
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

      }label: {
        HStack{
          Image("MapPin")

          VStack(alignment:.leading){
            Text("Where to ?")
              .font(.satoshiMedium(size: 12))
            Text("Select City")
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

      }label: {
        HStack{
          Image("CalendarBlank")
          VStack(alignment:.leading){
            Text("Start Date")
              .font(.satoshiMedium(size: 12))
            Text("Enter Date")
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

      }label: {
        HStack{
          Image("CalendarBlank")
          VStack(alignment:.leading){
            Text("End Date")
              .font(.satoshiMedium(size: 12))
            Text("End Date")
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
    .frame(maxWidth: .infinity,maxHeight:86)
    .background(Color(.systemBlue))
    .cornerRadius(4)
    .padding(.horizontal)

  }

}
