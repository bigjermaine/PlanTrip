//
//  ContentView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                mainSection
                activitiesView
                HotelsView
                flightView
                tripItinerariesView
                tripHotelView
                activitiesHotelView
            }
            .padding(.horizontal, 16) // Adjust this value as needed for overall padding
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    var mainSection: some View {
        VStack(alignment: .leading) {
            Image("body")
                .imageScale(.large)
                .frame(maxWidth: .infinity, maxHeight: 235)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("CalendarImage")
                    .padding(.leading)
                    Text("21 March 2024")
                        .font(.satoshiMedium(size: 12))
                        .foregroundColor(.grayText)

                    Image(.arrowRight)
                    Image("CalendarImage")
                    Text("21 March 2024")
                        .font(.satoshiMedium(size: 12))
                        .foregroundColor(.grayText)
                        .padding(.trailing)
                }
                .frame(height: 28)
                .background(Color.closeWhite)
                .cornerRadius(4)

                Text("Bahamas Family Trip")
                    .font(.satoshiBold(size: 16))
                    .foregroundColor(Color.blackText)
                Text("New York, United States of America | Solo Trip")
                    .font(.satoshiMedium(size: 12))
                    .foregroundColor(Color.grayText)
                HStack(spacing: 10) {
                    tripCollaborationButton
                    shareTipsButton
                    dotsButton
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }

    var tripCollaborationButton: some View {
        Button(action: {}) {
            HStack {
                Image(.handshake)
                Text("Trip Collaboration")
                    .foregroundColor(.systemBlue)
                    .font(.satoshiMedium(size: 14))
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).fill(Color.white))
            .cornerRadius(8)
            .overlay(textViewBorder())
        }
    }

    var shareTipsButton: some View {
        Button(action: {}) {
            HStack {
                Image(.shareIcon)
                Text("Share Trip")
                    .foregroundColor(.systemBlue)
                    .font(.satoshiMedium(size: 14))
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).fill(Color.white))
            .cornerRadius(8)
            .overlay(textViewBorder())
        }
    }

    var dotsButton: some View {
        Button(action: {}) {
            Image(.dotsThree)
        }
    }

    var activitiesView: some View {
        VStack(alignment: .leading, spacing: 20) {
          VStack(alignment: .leading, spacing: 20){
            Text("Activities")
              .font(.satoshiBold(size: 16))
            Text("Build, personalize, and optimize your itineraries with our trip planner.")
              .font(.satoshiMedium(size: 14))
            Button {
            } label: {
              Text("Add Activities")
                .font(.satoshiMedium(size: 14))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.systemBlue)
                .foregroundColor(.white)
                .cornerRadius(4)
            }
          }
            .padding()
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(Color.biroBlue)
        .cornerRadius(4)
        .padding(.horizontal, 10)
        .padding(.horizontal,5)
    }

    var HotelsView: some View {
        VStack(alignment: .leading, spacing: 20) {
          VStack(alignment: .leading, spacing: 20){
            Text("Hotels")
              .font(.satoshiBold(size: 16))
              .foregroundColor(.black)
            Text("Build, personalize, and optimize your itineraries with our trip planner.")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.grayText)
            Button {
            } label: {
              Text("Add Hotels")
                .font(.satoshiMedium(size: 14))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.systemBlue)
                .cornerRadius(4)
            }
          }
          .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.lightBlue)
        .cornerRadius(4)
        .padding(.horizontal, 10)
        .padding(.horizontal,5)
    }

    var flightView: some View {
        VStack(alignment: .leading, spacing: 20) {
          VStack(alignment: .leading, spacing: 20){
            Text("Flights")
              .font(.satoshiBold(size: 16))
              .foregroundColor(.white)
            Text("Build, personalize, and optimize your itineraries with our trip planner.")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.white)
            Button {
            } label: {
              Text("Add Flights")
                .font(.satoshiMedium(size: 14))
                .foregroundColor(.systemBlue)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(4)
            }
          }
          .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.systemBlue)
        .cornerRadius(4)
        .padding(.horizontal, 10)
        .padding(.horizontal,5)
    }

    var tripItinerariesView: some View {
        VStack(alignment: .leading) {
            Text("Trip itineraries")
                .font(.satoshiBold(size: 16))
            Text("Your trip itineraries are placed here")
                .font(.satoshiMedium(size: 14))
                .foregroundColor(.grayText)
            VStack(alignment: .leading) {
                HStack {
                    Image("AirplaneInFlight")
                    Text("Flights")
                        .font(.satoshiMedium(size: 16))
                        .foregroundColor(.grayText)
                }
                .padding()
                VStack(spacing: 20) {
                  VStack{
                    Image("planeImage")
                      .resizable()
                      .frame(width: 150, height: 150)
                      .padding(.top)
                    Text("No request yet")
                      .font(.satoshiBold(size: 16))
                      .foregroundColor(.grayText)
                    Button {
                    } label: {
                      Text("Add Flights")
                        .font(.satoshiMedium(size: 14))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.systemBlue)
                        .cornerRadius(4)
                    }
                  }
                  .padding()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white)
                .cornerRadius(4)
                .padding(.horizontal)
                .padding(.bottom)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.lightBlue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(4)
        .padding(.horizontal)
    }


  var tripHotelView: some View {

    VStack(alignment: .leading) {
      HStack {
        Image("hotelIcon")
        Text("Hotels")
          .font(.satoshiBold(size: 16))
          .foregroundColor(.white)
      }
      .padding()
      VStack(spacing: 20) {
        VStack{
          Image("hotelImage")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .padding(.top)
          Text("No request yet")
            .font(.satoshiBold(size: 16))
            .foregroundColor(.grayText)
          Button {
          } label: {
            Text("Add Hotel")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.white)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.systemBlue)
              .cornerRadius(4)
          }
        }
        .padding()
      }
      .frame(maxWidth: .infinity, alignment: .center)
      .background(Color.white)
      .cornerRadius(4)
      .padding(.horizontal)
      .cornerRadius(4)
      .padding(.bottom)

    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.ash)
    .cornerRadius(4)
    .padding(.horizontal)
  }


  var activitiesHotelView: some View {

    VStack(alignment: .leading) {
      HStack {
        Image("RoadHorizon")
        Text("Activities")
          .font(.satoshiBold(size: 16))
          .foregroundColor(.white)
      }
      .padding()
      VStack(spacing: 20) {
        VStack{
          Image("activitiesIcon")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .padding(.top)
          Text("No request yet")
            .font(.satoshiBold(size: 16))
            .foregroundColor(.grayText)
          Button {
          } label: {
            Text("Add Flight")
              .font(.satoshiMedium(size: 14))
              .foregroundColor(.white)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.systemBlue)
              .cornerRadius(4)
          }
        }
        .padding()
      }
      .frame(maxWidth: .infinity, alignment: .center)
      .background(Color.white)
      .cornerRadius(4)
      .padding(.horizontal)
      .padding(.bottom)

    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.systemBlue)
    .cornerRadius(4)
    .padding(.horizontal)

  }



    private func textViewBorder() -> some View {
        RoundedRectangle(cornerRadius: 4, style: .continuous)
            .stroke(Color.systemBlue, lineWidth: 1)
    }
}
