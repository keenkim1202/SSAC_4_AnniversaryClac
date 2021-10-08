//
//  AnniversaryCalc++DateFormatter.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import Foundation

extension DateFormatter {
  func toDate(date: String) -> Date {
    self.dateFormat = "yyyy/MM/dd"
    return self.date(from: date)!
  }
  
  func toString(date: Date) -> String {
    self.dateFormat = "yyyy/MM/dd"
    return self.string(from: date)
  }
}
