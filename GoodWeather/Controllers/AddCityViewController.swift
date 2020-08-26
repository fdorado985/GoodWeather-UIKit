//
//  AddCityViewController.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {

  // MARK: - Outlets

  @IBOutlet var addButton: UIButton!

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureController()
  }

  // MARK: - Actions

  @IBAction func addButtonDidTap(_ sender: UIButton) {
  }
}

// MARK: - Setup Views

extension AddCityViewController {

  private func configureController() {
    setupLayouts()
  }

  private func setupLayouts() {
    configureAddButtonAppearance()
  }

  private func configureAddButtonAppearance() {
    addButton.layer.cornerRadius = 5
  }
}
