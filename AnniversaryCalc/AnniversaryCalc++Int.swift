//
//  AnniversaryCalc++Int.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import Foundation

extension Int {
  var isOdd: Bool {
    return self % 2 == 0
  }
  
  var isEven: Bool {
    return self % 2 == 1
  }
  
  var isMinus: Bool {
    return self < 0
  }
  
  var isPlus: Bool {
    return self >= 0
  }
}
