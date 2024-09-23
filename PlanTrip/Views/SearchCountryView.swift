//
//  SearchCountryView.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import SwiftUI

struct SearchCountryView: View {
  @State private var searchText = ""
  @EnvironmentObject private var nav:MoreNavigationManager
  @EnvironmentObject private var setupViewModel :SetupViewModel
     let cities = [
         City(name: "Laghouat", region: "Laghouat", country: "Algeria", countryCode: "DZ"),
         City(name: "Lagos", region: "Murtala Muhammed", country: "Nigeria", countryCode: "NG"),
         City(name: "Doha", region: "Doha", country: "Qatar", countryCode: "QA")
     ]
  @FocusState private var isTextFieldFocused: Bool
  var body: some View {
    NavigationView {
      if setupViewModel.isLoading {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                  Button(action: {
                    nav.goToRoot()
                  }) {
                      Image(systemName: "xmark")
                      .foregroundStyle(.black)
                      Text("Where")
                      .font(.satoshiBold(size: 18))
                      .foregroundStyle(.black)
                  }
              }
          }
          .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                  Button(action: {
                    nav.goToRoot()
                  }) {
                      Image(systemName: "xmark")
                      .foregroundStyle(.black)
                      Text("Where")
                      .font(.satoshiBold(size: 18))
                      .foregroundStyle(.black)
                  }
              }
          }
          .navigationBarBackButtonHidden()
          .padding()
          .alert(isPresented:$setupViewModel.showAlertView) {
            Alert(title: Text("Alert"),message:Text(setupViewModel.error ?? ""), dismissButton: .cancel())
          }
      }else {
        ZStack{
          Color.white.ignoresSafeArea()
          VStack(alignment:.leading,spacing:20){
            Text("Please select a city")
              .font(.satoshiMedium(size: 12))
              .foregroundColor(.grayText)
            TextField("Lag", text: $searchText)
              .font(.satoshiMedium(size: 14))
              .frame(height: 76)
              .padding(5)
              .background(
                RoundedRectangle(cornerRadius: 4)
                  .fill(Color.white)
              )
              .overlay(textViewBorder())
              .focused($isTextFieldFocused)
            if !setupViewModel.cities.isEmpty {
              countryListView
            }else {
              Text("No city Found Try Again Later")
                .multilineTextAlignment(.center)
                .font(.satoshiMedium(size: 20))
                .foregroundColor(.grayText)
              Spacer()
            }
          }
          .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .leading)
          Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                  nav.goToRoot()
                }) {
                    Image(systemName: "xmark")
                    .foregroundStyle(.black)
                    Text("Where")
                    .font(.satoshiBold(size: 18))
                    .foregroundStyle(.black)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .padding()
        .alert(isPresented:$setupViewModel.showAlertView) {
          Alert(title: Text("Alert"),message:Text(setupViewModel.error ?? ""), dismissButton: .cancel())
        }
      }

    }
    .navigationBarBackButtonHidden()
    .onAppear{
      Task{
        await setupViewModel.getCities()
      }
    }
  }

  }


#Preview {
    SearchCountryView()
}


extension SearchCountryView {
  var countryListView:some View {
    List(setupViewModel.cities.filter { searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }) { city in
      HStack {
        Image("MapPin 1")
        VStack(alignment: .leading) {
          Text(city.name + ", " + city.country)
            .font(.satoshiBold(size: 16))
          Text(city.region)
            .font(.satoshiMedium(size: 14))
            .foregroundColor(.gray)
            .onTapGesture {
              setupViewModel.cityName = city.name
              nav.goToRoot()

            }
        }
        .padding(.leading)
        Spacer()
        VStack{
          Image(city.countryCode)
          Text(city.countryCode)
            .font(.caption)
            .padding(5)
            .cornerRadius(5)
        }
      }
      .listRowSeparator(.hidden)

          }
          .listStyle(.plain)
     }



  private func textViewBorder() -> some View {
    RoundedRectangle(cornerRadius: 4, style: .continuous) .stroke(isTextFieldFocused ? Color.blue : Color.grayText, lineWidth: 1)
      .focused($isTextFieldFocused)
  }
}
