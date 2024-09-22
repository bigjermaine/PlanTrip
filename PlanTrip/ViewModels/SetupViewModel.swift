//
//  SetupViewModel.swift
//  PlanTrip
//
//  Created by MacBook AIR on 22/09/2024.
//

import Foundation

@MainActor
class SetupViewModel:ObservableObject {
  @Published var tripName:String = ""
  @Published var tripStyle:DropdownMenuOption?
  @Published var tripDescription:String = ""
  @Published var cityName:String?
  @Published var startDate:String?
  @Published var endDate:String?
  @Published var error:String?
  @Published var isLoading: Bool = false
  @Published  var showAlertView: Bool = false
  @Published var cities:[Citys] = []
  var loginDisabled: Bool {
    ((cityName?.isEmpty) != nil) || ((startDate?.isEmpty) != nil) || ((endDate?.isEmpty) != nil)
  }

  var tripCreateDisabled: Bool {
    ((tripName.isEmpty)) || ((tripDescription.isEmpty)) || ((tripStyle?.option.isEmpty) != nil)
  }
  init() {
    Task{
      await getCities()
    }
  }
  func setUp() {
    HapticManager.shared.vibrate(for: .success)
    if !loginDisabled {
      HapticManager.shared.vibrate(for: .error)
      error = RegistrationError.nonSetupDetails.errorDescription
    }
  }

  func tripSetup() {
    if !tripCreateDisabled {
      HapticManager.shared.vibrate(for: .error)
      error = RegistrationError.errorCreatingTrip.errorDescription
    }
  }

  func getCities() async {
    isLoading = true
    do {
      HapticManager.shared.vibrate(for: .success)
      showAlertView = false
      isLoading = false
      cities =  try await NetworkManager.shared.fetchCities()
    }catch let error as CityError {
      HapticManager.shared.vibrate(for: .error)
      isLoading = false
      self.error = error.errorDescription
      showAlertView = true
    }catch {
      HapticManager.shared.vibrate(for: .error)
      isLoading = false
      self.error  = "An unexpected error occurred."
      showAlertView = true
    }
  }
}


