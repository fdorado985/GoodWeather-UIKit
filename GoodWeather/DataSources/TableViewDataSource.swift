//
//  TableViewDataSource.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 27/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {

  let cellIdentifier: String
  var items: [ViewModel]
  let configureCell: (CellType, ViewModel) -> Void

  init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> Void) {
    self.cellIdentifier = cellIdentifier
    self.items = items
    self.configureCell = configureCell
  }

  func updateItems(_ items: [ViewModel]) {
    self.items = items
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else {
      fatalError()
    }
    configureCell(cell, items[indexPath.row])
    return cell
  }
}
