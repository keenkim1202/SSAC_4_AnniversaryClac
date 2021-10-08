//
//  ListViewController.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import UIKit

class ListViewController: UIViewController {
  
  // MARK: Properties
  let cellInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

  let backgroundImages: [String] = [
    "background_1", "background_2", "background_3", "background_4",
    "background_5", "background_6", "background_7", "background_8",
    "background_9", "background_10", "background_11", "background_12", "background_13"
  ]
  
  let testColors: [UIColor] = [ // for cell size test.
    .red, .orange, .yellow, .green,
    .blue, .purple, .black, .gray,
    .systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue
  ]
  
  var anniversaryList: [Anniversary] = [
    Anniversary(title: "생일", date: Date(), dday: "+100"),
    Anniversary(title: "설날", date: Date(), dday: "+120"),
    Anniversary(title: "빼빼로데이", date: Date(), dday: "+30"),
    Anniversary(title: "크리스마스", date: Date(), dday: "+53")
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
    cell.anniImageView.backgroundColor = testColors[indexPath.row]
    cell.anniTitleLabel.text = item.title
    cell.anniDDaylabel.text = item.dday
    return cell
  }
}

