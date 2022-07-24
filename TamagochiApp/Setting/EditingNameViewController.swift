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
    }
    
    @IBAction func changeUserName(_ sender: UITextField) {
        print("User Name Changed: \(userNameTextField.text)")
    }
    
}
