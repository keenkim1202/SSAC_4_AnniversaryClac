//
//  AnniversaryData.swift
//  AnniversaryCalc
//
//  Created by KEEN on 2021/10/27.
//

import Foundation

struct AnniversaryData {
  static var anniversaryList: [Anniversary] = [
    Anniversary(title: "광복절", date: "2021-08-15"),
    Anniversary(title: "생일", date: "2021-12-13"),
    Anniversary(title: "설날", date: "2022-01-01"),
    Anniversary(title: "빼빼로데이", date: "2021-11-11"),
    Anniversary(title: "크리스마스", date: "2021-12-25"),
    Anniversary(title: "모레", date: "2021-10-10"),
    Anniversary(title: "내일", date: "2021-10-09"),
    Anniversary(title: "오늘", date: "2021-10-08"),
    Anniversary(title: "어제", date: "2021-10-07")
  ].sorted { $0.date < $1.date }
}
