//
//  CitiesListViewModel.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

class CitiesListViewModel {

  private var cities = [CityViewModel]()

  var numberOfCities: Int {
    return cities.count
  }

  func appendCity(_ city: CityViewModel) {
    cities.append(city)
  }

  func cityForIndex(at indexPath: IndexPath) -> CityViewModel {
    return cities[indexPath.row]
  }
}

struct CityViewModel {

  let name: String
  let temperature: Double
  let unit: Unit
}
