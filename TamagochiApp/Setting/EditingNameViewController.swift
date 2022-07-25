//
//  EditingNameViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/24.
//

import UIKit

/// 이름 변경하기 화면 Controller
class EditingNameViewController: UIViewController {

    /// 이름 변경 Text Field
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UISetting.backgroundColor
        userNameTextField.text = UserDefaults.standard.string(forKey: UserData.userName)
    }
    
//    @IBAction func changeUserName(_ sender: UITextField) {
//        if userNameTextField.text != nil {
//            UserDefaults.standard.set(userNameTextField.text!, forKey: "userName")
//        }
//    }
    
    /// 저장 버튼 클릭 이벤트 메서드
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
//        print(userNameTextField.text)
        if userNameTextField.text != "" {
            print("true")
            UserDefaults.standard.set(userNameTextField.text!, forKey: UserData.userName)
        } else {
            print("대장")
            UserDefaults.standard.set("대장", forKey: UserData.userName)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    /// 화면 탭 시 키보드 내려가기 구현 메서드
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
