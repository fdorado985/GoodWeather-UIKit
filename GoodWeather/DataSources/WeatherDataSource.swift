//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 27/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {

  private var viewModel: CitiesListViewModel
  private let cellIdentifier = "CityCell"

  init(_ viewModel: CitiesListViewModel) {
    self.viewModel = viewModel
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfCities
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    let city = viewModel.cityForIndex(at: indexPath)
    configureCell(cell, city: city)
    return cell
  }

  private func configureCell(_ cell: UITableViewCell, city: CityViewModel) {
    cell.textLabel?.text = "\(city.name) (\(city.unit.displayName))"
    cell.textLabel?.font = .preferredFont(forTextStyle: .callout)
    cell.textLabel?.textColor = .systemGray
    cell.detailTextLabel?.text = city.temperature.toDegree
    cell.detailTextLabel?.font = .preferredFont(forTextStyle: .title1)
    cell.detailTextLabel?.textColor = .systemRed
  }
}
