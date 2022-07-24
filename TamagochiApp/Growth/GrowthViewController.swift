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
    
    override func viewWillAppear(_ animated: Bool) {
        talkLabel.text = TalkMent.talkMent.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UISetting.backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UISetting.fontColor, .font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
        
        UISetting.setNameLabelUI(label: titleLabel)
        titleLabel.text = name
        
        growthLabel.textColor = UISetting.fontColor
        growthLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        growthLabel.text = "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
        talkLabel.font = .systemFont(ofSize: 13, weight: .semibold)
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
                if Int(riceTextField.text!)! < 99 {
                    rice += Int(riceTextField.text!)!
                } else {
                    riceTextField.text = ""
                    riceTextField.placeholder = "99 이하로 입력해주세요"
                    return
                }
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
                if Int(waterTextField.text!)! < 49 {
                    water += Int(waterTextField.text!)!
                } else {
                    waterTextField.text = ""
                    waterTextField.placeholder = "49 이하로 입력해주세요"
                }
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
