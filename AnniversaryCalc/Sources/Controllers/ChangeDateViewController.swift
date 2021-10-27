//
//  ChangeDateViewController.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/27.
//

import UIKit

class ChangeDateViewController: UIViewController {
  
  // MARK: - UI
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var choosenLabel: UILabel!
  
  // MARK: - View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Actions
  @IBAction func onCancel(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func onChange(_ sender: UIBarButtonItem) {
    
    
    self.navigationController?.popViewController(animated: true)
  }
}

