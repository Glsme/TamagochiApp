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
        
        userNameTextField.text = UserDefaults.standard.string(forKey: "userName")
    }
    
    @IBAction func changeUserName(_ sender: UITextField) {
        if userNameTextField.text != nil {
            UserDefaults.standard.set(userNameTextField.text!, forKey: "userName")
        }
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}
