//
//  ChangeDateViewController.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/27.
//

import UIKit

class ChangeDateViewController: UIViewController {
  
  // MARK: - Properties
  var changeDate = Date()
  
  // MARK: - UI
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var choosenLabel: UILabel!
  
  // MARK: - View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - PrepareForSegue
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! ListViewController
    destination.today = changeDate
  }
  

  

  // MARK: - Actions
  @IBAction func onCancel(_ sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  @IBAction func onChange(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: "unwindToListVC", sender: self)

  }
  
  @IBAction func onDatePicker(_ sender: UIDatePicker) {
    let df = DateFormatter()
    df.locale = Locale(identifier: "ko-KR")
    df.dateStyle = . medium
    df.timeStyle = .medium
    
    changeDate = datePicker.date
    choosenLabel.text = df.string(from: changeDate)
  }
}
