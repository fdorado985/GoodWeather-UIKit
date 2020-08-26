//
//  CitiesListViewController.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class CitiesListViewController: UITableViewController {

  // MARK: - Properties

  private var viewModel = CitiesListViewModel()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "\(AddCityViewController.self)",
      let addCityVC = segue.destination as? AddCityViewController {
      addCityVC.delegate = self
    }
  }
}

// MARK: - UITableView Delegate & DataSource

extension CitiesListViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfCities
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
    let city = viewModel.cityForIndex(at: indexPath)
    configureCell(cell, city: city)
    return cell
  }

  private func configureCell(_ cell: UITableViewCell, city: CityViewModel) {
    cell.textLabel?.text = city.name
    cell.textLabel?.font = .preferredFont(forTextStyle: .callout)
    cell.textLabel?.textColor = .systemGray
    cell.detailTextLabel?.text = city.temperature.toDegree
    cell.detailTextLabel?.font = .preferredFont(forTextStyle: .title1)
    cell.detailTextLabel?.textColor = .systemRed
  }
}

// MARK: - AddCityDelegate

extension CitiesListViewController: AddCityDelegate {

  func addCityViewController(_ viewController: UIViewController, didAddCity city: CityViewModel) {
    viewController.navigationController?.popViewController(animated: true)
    viewModel.appendCity(city)
    tableView.reloadData()
  }
}
