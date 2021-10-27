//
//  AddViewController.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/08.
//

import UIKit

class AddViewController: UIViewController {
  
  // MARK: - Properties
  var newDate = Date()
  
  let df: DateFormatter = {
    let df = DateFormatter()
    df.locale = Locale(identifier: "ko-KR")
    df.dateStyle = . medium
    df.timeStyle = .medium
    return df
  }()
  
  // MARK: - UI
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var anniversaryView: UIView!
  
  // MARK: - View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: Alert
  fileprivate func showAlert(_ title: String, _ message: String ) {
    UIAlertController.show(self, title: title, message: message)
  }
  
  // MARK: - Action
  @IBAction func onDatePicker(_ sender: UIDatePicker) {
    self.view.endEditing(true)
    newDate = datePicker.date
    dateLabel.text = df.string(from: newDate)
  }
  
  @IBAction func onAddButton(_ sender: Any) {
    let title = titleTextField.text!
    if !title.isEmpty {
      let date = df.toString(date: newDate)
      AnniversaryData.anniversaryList.append(Anniversary(title: title, date: date))
      self.view.endEditing(true)
      titleTextField.text = ""
      showAlert("🎊", "기념일 추가 성공!")
    } else {
      showAlert("⚠️ 오류 🤯", "어떤 기념일인가요?\n타이틀을 적어주세요.")
    }
  }
}
