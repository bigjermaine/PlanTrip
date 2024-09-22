//
//  MoreNavigationManager.swift
//  PlanTrip
//
//  Created by MacBook AIR on 21/09/2024.
//

import Foundation

class MoreNavigationManager: ObservableObject {
  @Published var path: [Navigations] = []

  enum Navigations:Hashable{
    case search
    case Date 
    case main
    case Details
  }

  func goToRoot() {
      path.removeAll()
  }

  func loadView(_ item: Navigations) {
      path.append(item)
  }

  func swapView(_ item: Navigations) {
      path.removeLast()
      path.append(item)
  }

  func replaceStack(_ item: Navigations) {
      path.removeAll()
      Task { @MainActor in
          // The time delay may be device/app specific.
          try? await Task.sleep(nanoseconds: 400_000_000)
          loadView(item)
      }
  }

}


