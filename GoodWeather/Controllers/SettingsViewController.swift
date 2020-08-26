//
//  SettingsViewController.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureController()
  }
}

// MARK: - Setup Views

extension SettingsViewController {

  private func configureController() {
    title = "Settings"
    navigationItem.largeTitleDisplayMode = .never
  }
}
