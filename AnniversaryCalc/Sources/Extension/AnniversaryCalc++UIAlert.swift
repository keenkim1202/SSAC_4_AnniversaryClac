//
//  AnniversaryCalc++UIAlert.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/27.
//

import UIKit

extension UIAlertController {
  static func show(_ presentedHost: UIViewController,
                   title: String,
                   message: String) {
    let alert = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert)
    let okAction = UIAlertAction(
      title: "확인", style: .default, handler: nil)
    alert.addAction(okAction)
    presentedHost.present(alert, animated: true, completion: nil)
  }
}
