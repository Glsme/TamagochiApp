//
//  GrowthViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/24.
//

import UIKit

///다마고치 키우기 화면 Controller
class GrowthViewController: UIViewController {
    
    static var identifier = "GrowthViewController"
    @IBOutlet weak var talkLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var growthLabel: UILabel!
    @IBOutlet weak var SelectedImageView: UIImageView!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet var buttons: [UIButton]!
    
    
    var name: String?
    var level = 1
    var rice = 0
    var water = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UISetting.backgroundColor
        
        UISetting.setNameLabelUI(label: titleLabel)
        titleLabel.text = name
        
        growthLabel.textColor = UISetting.fontColor
        growthLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        growthLabel.text = "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
        talkLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        talkLabel.text = "안녕하세요~!"
        talkLabel.textColor = UISetting.fontColor
        
        setButtonUI()
    }
    
    func setButtonUI() {
        for item in buttons {
            item.layer.borderWidth = 1
            item.layer.borderColor = UISetting.fontColor.cgColor
            item.layer.cornerRadius = 4
        }
    }

    @IBAction func riceButtonClicked(_ sender: UIButton) {
        if riceTextField.text! == "" {
            rice += 1
            
        } else {
            if Int(riceTextField.text!) != nil {
                rice += Int(riceTextField.text!)!
            } else {
                riceTextField.placeholder = "숫자만 입력해주세요"
            }
        }
        riceTextField.text = ""
        growthLabel.text = "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
        talkLabel.text = TalkMent.talkMent.randomElement()
    }
    
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        if waterTextField.text! == "" {
            water += 1
        } else {
            if Int(waterTextField.text!) != nil {
                water += Int(waterTextField.text!)!
            } else {
                waterTextField.placeholder = "숫자만 입력해주세요"
            }
        }
        waterTextField.text = ""
        growthLabel.text = "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
        talkLabel.text = TalkMent.talkMent.randomElement()

    }
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
