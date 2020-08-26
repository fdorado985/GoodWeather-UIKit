//
//  CitiesListViewModel.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct CitiesListViewModel {

  private var cities = [CityViewModel]()
}

struct CityViewModel {

  let name: String
  let temperature: Double
}
