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
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UISetting.backgroundColor
        
        UISetting.setNameLabelUI(label: titleLabel)
        titleLabel.text = name
    }

}
