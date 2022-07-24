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
    @IBOutlet weak var infoLineView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInfoUI()
    }
    

    func configureInfoUI() {
        infoView.backgroundColor = UISetting.backgroundColor
        infoLineView.backgroundColor = UISetting.fontColor
        
        
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        
    }
}
