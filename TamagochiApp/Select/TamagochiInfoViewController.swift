//
//  TamagochiInfoViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/23.
//

import UIKit

class TamagochiInfoViewController: UIViewController {

    static var identifier = "TamagochiInfoViewController"
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        configureInfoUI()
    }
    

    func configureInfoUI() {
        infoView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
    }
}
