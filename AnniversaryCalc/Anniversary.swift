//
//  Anniversary.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import Foundation
import UIKit

class Anniversary {
  var title: String
  var date: Date?
  var dday: String
  var image: UIImage?
  
  init(title: String, date: Date?, dday: String) {
    self.title = title
    self.date = date ?? Date()
    self.dday = dday
  }
}
