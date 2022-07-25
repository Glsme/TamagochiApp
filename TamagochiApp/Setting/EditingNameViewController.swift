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
        userNameTextField.text = UserDefaults.standard.string(forKey: "userName")
    }
    
//    @IBAction func changeUserName(_ sender: UITextField) {
//        if userNameTextField.text != nil {
//            UserDefaults.standard.set(userNameTextField.text!, forKey: "userName")
//        }
//    }
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        if userNameTextField.text != nil {
            UserDefaults.standard.set(userNameTextField.text!, forKey: "userName")
        } else {
            UserDefaults.standard.set("대장", forKey: "userName")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
