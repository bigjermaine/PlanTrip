//
//  Errors.swift
//  PlanTrip
//
//  Created by MacBook AIR on 22/09/2024.
//

import Foundation


enum RegistrationError:Error {
    case invalidPhoneNumber
    case errorTitle
    case nonSetupDetails
    case errorCreatingTrip
    case errorOtp
    case deletingAccount
    var errorDescription:String? {
        switch self {
        case .invalidPhoneNumber:
            return "PhoneNumber is invalid"
        case .errorTitle:
            return "Error"
        case .errorOtp:
            return "Error Otp"
        case .deletingAccount:
            return  "Warning Deleting Account"
        case .nonSetupDetails:
          return "Kindly choose a city, start and end date"
        case .errorCreatingTrip:
          return "Kindly choose a trip style or fill in all details"
        }
    }
}


enum CityError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case decodingFailed(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .requestFailed(let error):
            return "Request failed: \(error.localizedDescription)"
        case .decodingFailed(let error):
            return "Decoding failed: \(error.localizedDescription)"
        }
    }
}
