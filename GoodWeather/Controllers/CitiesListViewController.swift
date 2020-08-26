//
//  CitiesListViewController.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class CitiesListViewController: UITableViewController {

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    WeatherService.load(query: "torreon", unit: "imperial") { result in
      switch result {
      case .success(let weather):
        print(weather)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

}

// MARK: - UITableView Delegate & DataSource

extension CitiesListViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
    cell.textLabel?.text = "Houston"
    cell.textLabel?.font = .preferredFont(forTextStyle: .callout)
    cell.textLabel?.textColor = .systemGray
    cell.detailTextLabel?.text = "28°"
    cell.detailTextLabel?.font = .preferredFont(forTextStyle: .title1)
    cell.detailTextLabel?.textColor = .systemRed
    return cell
  }
}
