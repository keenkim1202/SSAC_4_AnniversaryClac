//
//  AddViewController.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import UIKit

class AddViewController: UIViewController {
  
  // MARK: UI
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var titleTextField: UITextField!
  
  @IBOutlet weak var anniversaryView: UIView!
  @IBOutlet weak var addButton: UIButton!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: Action
  @IBAction func onAddButton(_ sender: UIButton) {
  }
  
}

