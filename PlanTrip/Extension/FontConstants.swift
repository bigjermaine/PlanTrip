//
//  FontConstants.swift
//  PlanTrip
//
//  Created by MacBook AIR on 19/09/2024.
//

import Foundation
import UIKit
import SwiftUI
extension Font {
    static func satoshiRegular(size: CGFloat) -> Font {
        return Font.custom("Satoshi-Regular", size: size)
    }

    static func satoshiMedium(size: CGFloat) -> Font {
        return Font.custom("Satoshi-Medium", size: size)
    }

    static func satoshiLight(size: CGFloat) -> Font {
        return Font.custom("Satoshi-Light", size: size)
    }

    static func satoshiBold(size: CGFloat) -> Font {
        return Font.custom("Satoshi-Bold", size: size)
    }
  static func satoshiItalics(size: CGFloat) -> Font {
      return Font.custom("Satoshi-MediumItalic", size: size)
  }


}
