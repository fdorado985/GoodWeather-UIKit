//
//  SettingsViewController.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

  // MARK: - Properties

  private var viewModel = SettingsViewModel()

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureController()
  }
}

// MARK: - UITableView Delegate & DataSource

extension SettingsViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfUnits
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath)
    cell.textLabel?.text = viewModel.unit(at: indexPath)
    return cell
  }
}

// MARK: - Setup Views

extension SettingsViewController {

  private func configureController() {
    title = "Settings"
    navigationItem.largeTitleDisplayMode = .never
    tableView.tableFooterView = UIView()
  }
}
