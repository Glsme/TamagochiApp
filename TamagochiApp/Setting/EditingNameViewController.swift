//
//  EditingNameViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/24.
//

import UIKit

class EditingNameViewController: UIViewController {

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
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        print(userNameTextField.text)
        if userNameTextField.text != "" {
            print("true")
            UserDefaults.standard.set(userNameTextField.text!, forKey: UserData.userName)
        } else {
            print("대장")
            UserDefaults.standard.set("대장", forKey: UserData.userName)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
