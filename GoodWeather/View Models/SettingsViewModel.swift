//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
  case celsius = "metric"
  case fahrenheit = "imperial"
  case kelvin = "kelvin"
}

extension Unit {

  var displayName: String {
    switch self {
    case .celsius:
      return "Celcius"
    case .fahrenheit:
      return "Fahrenheit"
    case .kelvin:
      return self.rawValue.capitalized
    }
  }
}

struct SettingsViewModel {

  private let units = Unit.allCases

  var numberOfUnits: Int {
    return units.count
  }

  func unit(at indexPath: IndexPath) -> String {
    return units[indexPath.row].displayName
  }
}
