//
//  UISetting.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/24.
//

import UIKit

/// UI 설정 관련 구조체
struct UISetting {
    
    private init() { }
    
    static var fontColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    static var backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    static var regularFont = UIFont.systemFont(ofSize: 13, weight: .regular)
    
    static func setNameLabelUI(label: UILabel) {
        label.textColor = UISetting.fontColor
        label.backgroundColor = UISetting.backgroundColor
        label.layer.borderColor = UISetting.fontColor.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 2
        label.font = .systemFont(ofSize: 13, weight: .semibold)
    }
}
