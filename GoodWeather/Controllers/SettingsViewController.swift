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

  // MARK: - Actions

  @objc private func doneBarButtonItemDidTap(_ sender: UIBarButtonItem) {

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

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    cell?.accessoryType = .checkmark
  }

  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    cell?.accessoryType = .none
  }
}

// MARK: - Setup Views

extension SettingsViewController {

  private func configureController() {
    title = "Settings"
    let doneBarButtonItem = UIBarButtonItem(
      barButtonSystemItem: .save,
      target: self,
      action: #selector(doneBarButtonItemDidTap)
    )
    navigationItem.rightBarButtonItem = doneBarButtonItem
    navigationItem.largeTitleDisplayMode = .never
    tableView.tableFooterView = UIView()
  }
}
