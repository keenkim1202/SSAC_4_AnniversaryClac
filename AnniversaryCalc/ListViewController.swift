//
//  ListViewController.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import UIKit

class ListViewController: UIViewController {
  
  // MARK: Properties
  let today = Date()
  
  let cellInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

  let backgroundImages: [String] = [
    "background_1", "background_2", "background_3", "background_4",
    "background_5", "background_6", "background_7", "background_8",
    "background_9", "background_10", "background_11", "background_12"
  ]
  
  var anniversaryList: [Anniversary] = [
    Anniversary(title: "광복절", date: "2021-08-15"),
    Anniversary(title: "생일", date: "2021-12-13"),
    Anniversary(title: "설날", date: "2022-01-01"),
    Anniversary(title: "빼빼로데이", date: "2021-11-11"),
    Anniversary(title: "크리스마스", date: "2021-12-25"),
    Anniversary(title: "모레", date: "2021-10-10"),
    Anniversary(title: "내일", date: "2021-10-09"),
    Anniversary(title: "오늘", date: "2021-10-08"),
    Anniversary(title: "어제", date: "2021-10-07")
  ]
  
  // MARK: UI
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
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
    return anniversaryList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as! ListCollectionViewCell
    cell.cellConfigure()
    
    let item = anniversaryList[indexPath.row]
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

