//
//  ListViewController.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import UIKit

class ListViewController: UIViewController {
  
  // MARK: Properties
  var today = Date()
  
  let cellInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

  let backgroundImages: [String] = [
    "background_1", "background_2", "background_3", "background_4",
    "background_5", "background_6", "background_7", "background_8",
    "background_9", "background_10", "background_11", "background_12"
  ]
  
  // MARK: UI
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.collectionView.reloadData()
  }
  
  func getRandomBackgroundImage(_ images: [String]) -> UIImage {
    let imgName = images.randomElement()!
    return UIImage(named: imgName) ?? UIImage(systemName: "pencil")!
  }
  
  func getDday(_ anniversary: Anniversary) -> Int {
    let df = DateFormatter()
    let anniDate = df.toDate(date: anniversary.date)
    return today.daysBetween(date: anniDate)
  }
}

// MARK: Extension - UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
extension ListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let width = collectionView.frame.width
      let itemsPerRow: CGFloat = 2
      
      let widthPadding = cellInsets.top * (itemsPerRow + 1)
      let cellWidth = (width - widthPadding) / itemsPerRow
    
      return CGSize(width: cellWidth, height: cellWidth)
  }
}

// MARK: Extension - UICollectionViewDataSource
extension ListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return AnniversaryData.anniversaryList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! ListCollectionViewCell
    cell.cellConfigure()
    
    let item = AnniversaryData.anniversaryList[indexPath.row]
    cell.anniImageView.image = getRandomBackgroundImage(backgroundImages)
    cell.anniTitleLabel.text = item.title
    cell.anniDateLabel.text = item.date

    let dday = getDday(item)
    
    if dday.isPlus {
      cell.anniDDaylabel.text = "-\(dday)일"
    } else {
      cell.anniDDaylabel.text = "+\(-dday)일"
    }
    
    return cell
  }
}

