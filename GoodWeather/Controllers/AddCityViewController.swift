//
//  AddCityViewController.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

protocol AddCityDelegate: class {
  func addCityViewController(_ viewController: UIViewController, didAddCity city: CityViewModel)
}

class AddCityViewController: UIViewController {

  // MARK: - Outlets

  @IBOutlet var cityTextField: UITextField!
  @IBOutlet var addButton: UIButton!

  // MARK: - Properties

  weak var delegate: AddCityDelegate?

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureController()
  }

  // MARK: - Actions

  @IBAction func addButtonDidTap(_ sender: UIButton) {
    guard let city = cityTextField.text, !city.isEmpty else { return }
    getCurrentWeather(of: city)
  }

  // MARK: - Methods

  private func getCurrentWeather(of city: String) {
    WeatherService.getCurrentWeather(query: city, unit: "imperial") { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let city):
        DispatchQueue.main.async {
          self.delegate?.addCityViewController(self, didAddCity: city)
        }
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
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
