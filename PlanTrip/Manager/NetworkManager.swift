//
//  NetworkManager.swift
//  PlanTrip
//
//  Created by MacBook AIR on 22/09/2024.
//

import Foundation

class NetworkManager {
 static let shared = NetworkManager()


  func fetchCities() async throws -> [Citys] {
      guard let url = URL(string: "https://jermaine.free.beeceptor.com/cities") else {
          throw CityError.invalidURL
      }

      do {
          let (data, _) = try await URLSession.shared.data(from: url)
          let cities = try JSONDecoder().decode([Citys].self, from: data)
          return cities
      } catch {
          throw CityError.requestFailed(error)
      }
  }


  func fetchOptions() async throws -> [DropdownMenuOption] {
      guard let url = URL(string: "https://jermaine.free.beeceptor.com/values") else {
          throw CityError.invalidURL
      }

      do {
          let (data, _) = try await URLSession.shared.data(from: url)
          let cities = try JSONDecoder().decode([DropdownMenuOption].self, from: data)
          return cities
      } catch {
          throw CityError.requestFailed(error)
      }
  }

}
