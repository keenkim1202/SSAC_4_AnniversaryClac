//
//  ListCollectionViewCell.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var anniImageView: UIImageView!
  @IBOutlet weak var anniDateLabel: UILabel!
  @IBOutlet weak var anniTitleLabel: UILabel!
  @IBOutlet weak var anniDDaylabel: UILabel!
  
  func cellConfigure() {
    self.layer.cornerRadius = CGFloat(8)
    self.anniImageView.contentMode = .scaleAspectFill
  }
}
