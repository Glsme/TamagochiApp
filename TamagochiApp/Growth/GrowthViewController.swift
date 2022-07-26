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
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet var buttons: [UIButton]!
    
    var userName: String?
    var name: String?
    var level = 1
    var rice = 0
    var water = 0
    var imageString: String?
    var imageInt = 1
    
    ///이름 변경에 따른 UI 구현 관련 메서드
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        talkLabel.text = TalkMent.talkMent.randomElement()
        userName = UserDefaults.standard.string(forKey: UserData.userName)
        self.navigationItem.title = "\(userName!)님의 다마고치"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UISetting.backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UISetting.fontColor, .font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
        
        UISetting.setNameLabelUI(label: titleLabel)
        titleLabel.text = UserDefaults.standard.string(forKey: UserData.tamagochiName)
        
        growthLabel.textColor = UISetting.fontColor
        growthLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        
        talkLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        talkLabel.textColor = UISetting.fontColor
        
        setButtonUI()
        
        if UserDefaults.standard.integer(forKey: UserData.rice) != 0 {
            self.rice = UserDefaults.standard.integer(forKey: UserData.rice)
        }
        
        if UserDefaults.standard.integer(forKey: UserData.water) != 0 {
            self.water = UserDefaults.standard.integer(forKey: UserData.water)
        }
        
        if UserDefaults.standard.integer(forKey: UserData.level) != 0 {
            self.level = UserDefaults.standard.integer(forKey: UserData.level)
        }
        
        loadImageString()
        setImage()
        growthLabel.text = "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
        
        UserDefaults.standard.set(true, forKey: UserData.first)
        
        if UserDefaults.standard.string(forKey: UserData.userName) == nil || UserDefaults.standard.string(forKey: UserData.userName) == "" {
            UserDefaults.standard.set("대장", forKey: UserData.userName)
            userName = UserDefaults.standard.string(forKey: UserData.userName)!
            self.navigationItem.title = "\(userName!)님의 다마고치"
        } else {
            userName = UserDefaults.standard.string(forKey: UserData.userName)!
            self.navigationItem.title = "\(userName!)님의 다마고치"
        }
    }
    
    /// 버튼 UI 설정 메서드
    func setButtonUI() {
        for item in buttons {
            item.layer.borderWidth = 1
            item.layer.borderColor = UISetting.fontColor.cgColor
            item.layer.cornerRadius = 4
        }
    }

    /// 밥먹기 버튼 클릭 이벤트 메서드
    @IBAction func riceButtonClicked(_ sender: UIButton) {
        if riceTextField.text! == "" {
            rice += 1
            
        } else {
            if Int(riceTextField.text!) != nil {
                if Int(riceTextField.text!)! < 100 {
                    rice += Int(riceTextField.text!)!
                    riceTextField.placeholder = "밥주세용"
                } else {
                    riceTextField.text = ""
                    riceTextField.placeholder = "99 이하로 입력해주세요"
                    return
                }
            } else {
                riceTextField.placeholder = "숫자만 입력해주세요"
                return
            }
        }
        riceTextField.text = ""
        calculateLevel()
        loadImageString()
        setImage()
        growthLabel.text = "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
        talkLabel.text = TalkMent.talkMent.randomElement()
        UserDefaults.standard.set(self.imageString, forKey: UserData.tamagochiImageString)
        UserDefaults.standard.set(self.rice, forKey: UserData.rice)
        UserDefaults.standard.set(self.level, forKey: UserData.level)
    }
    
    /// 물먹기 버튼 클릭 이벤트 메서드
    @IBAction func waterButtonClicked(_ sender: UIButton) {
        if waterTextField.text! == "" {
            water += 1
        } else {
            if Int(waterTextField.text!) != nil {
                if Int(waterTextField.text!)! < 50 {
                    water += Int(waterTextField.text!)!
                    waterTextField.placeholder = "물주세용"
                } else {
                    waterTextField.text = ""
                    waterTextField.placeholder = "49 이하로 입력해주세요"
                    return
                }
            } else {
                waterTextField.placeholder = "숫자만 입력해주세요"
                return
            }
        }
        
        waterTextField.text = ""
        calculateLevel()
        loadImageString()
        setImage()
        growthLabel.text = "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
        talkLabel.text = TalkMent.talkMent.randomElement()
        UserDefaults.standard.set(self.water, forKey: UserData.water)
        UserDefaults.standard.set(self.level, forKey: UserData.level)
    }
    
    /// 레벨 계산 메서드
    func calculateLevel() {
        let calculator: Double = Double(rice/5) + Double(water/2)
        print(calculator)
        
        if calculator < 20 {
            level = 1
        } else if calculator > 100 {
            level = 10
        } else {
            level = Int(calculator) / 10
        }
    }
    
    /// 이미지 계산 메서드
    func setImage() {
        guard let imageString = self.imageString else { return }
        switch self.level {
        case 0...1:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 2:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 3:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 4:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 5:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 6:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 7:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 8:
            selectedImageView.image = UIImage(named: imageString + "\(level)")
        case 9...:
            selectedImageView.image = UIImage(named: imageString + "\(9)")
        default:
            break
        }
    }
    
    /// 이미지 불러오기 메서드
    func loadImageString() {
        guard let image = UserDefaults.standard.string(forKey: UserData.tamagochiImageString) else { return }
        if image.contains("1-") {
            self.imageString = "1-"
        } else if image.contains("2-") {
            self.imageString = "2-"
        } else if image.contains("3-") {
            self.imageString = "3-"
        }
    }
    
    /// 화면 탭 시 키보드 내려가기 메서드
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
