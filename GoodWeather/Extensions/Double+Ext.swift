//
//  Double+Ext.swift
//  GoodWeather
//
//  Created by Juan Francisco Dorado Torres on 26/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

extension Double {

  var toDegree: String {
    return String(format: "%.2f°", self)
  }
}
