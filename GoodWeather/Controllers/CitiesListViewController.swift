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
  }

  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "\(AddCityViewController.self)", let vc = segue.destination as? AddCityViewController {
      vc.delegate = self
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

// MARK: - AddCityDelegate

extension CitiesListViewController: AddCityDelegate {

  func addCityViewController(_ viewController: UIViewController, didAddCity city: CityViewModel) {
    viewController.navigationController?.popViewController(animated: true)
    print(city)
  }
}
