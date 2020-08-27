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
  private var dataSource: TableViewDataSource<UITableViewCell, CityViewModel>!

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureController()
  }

  // MARK: - Actions

  @objc private func settingsBarButtonItemDidTap(_ sender: UIBarButtonItem) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let settingsViewController = storyboard
      .instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
      fatalError("\(#function) Could not get \(SettingsViewController.self)")
    }

    navigationController?.pushViewController(settingsViewController, animated: true)
  }

  // MARK: - Methods

  private func configureCell(_ cell: UITableViewCell, city: CityViewModel) {
    cell.textLabel?.text = "\(city.name) (\(city.unit.displayName))"
    cell.textLabel?.font = .preferredFont(forTextStyle: .callout)
    cell.textLabel?.textColor = .systemGray
    cell.detailTextLabel?.text = city.temperature.toDegree
    cell.detailTextLabel?.font = .preferredFont(forTextStyle: .title1)
    cell.detailTextLabel?.textColor = .systemRed
  }

  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "\(AddCityViewController.self)",
      let addCityVC = segue.destination as? AddCityViewController {
      addCityVC.delegate = self
    }
  }
}

// MARK: - AddCityDelegate

extension CitiesListViewController: AddCityDelegate {

  func addCityViewController(_ viewController: UIViewController, didAddCity city: CityViewModel) {
    viewController.navigationController?.popViewController(animated: true)
    viewModel.appendCity(city)
    dataSource.updateItems(viewModel.getCities)
    tableView.reloadData()
  }
}

// MARK: - Setup View

extension CitiesListViewController {

  private func configureController() {
    let settingsBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "gear"),
      style: .plain,
      target: self,
      action: #selector(settingsBarButtonItemDidTap)
    )
    navigationItem.leftBarButtonItem = settingsBarButtonItem
    dataSource = TableViewDataSource(
      cellIdentifier: "CityCell",
      items: viewModel.getCities,
      configureCell: configureCell
    )
    tableView.dataSource = dataSource
  }
}
