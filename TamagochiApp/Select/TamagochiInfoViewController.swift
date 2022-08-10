//
//  TamagochiInfoViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/23.
//

import UIKit

/// 다마고치 상세화면 Controller
class TamagochiInfoViewController: UIViewController {

    static var identifier = "TamagochiInfoViewController"
    
    var name: String?
    var overview: String?
    var imageString: String?
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoLineView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var infoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInfoUI()
        putInfoData()
    }
    
    /// 기본 UI 설정 메서드
    func configureInfoUI() {
        infoView.backgroundColor = UISetting.backgroundColor
        infoLineView.backgroundColor = UISetting.fontColor
        
        titleLabel.font = UISetting.regularFont
        titleLabel.textColor = UISetting.fontColor
        titleLabel.layer.backgroundColor = UISetting.backgroundColor.cgColor
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = UISetting.fontColor.cgColor
        titleLabel.layer.cornerRadius = 2
        
        overViewLabel.textColor = UISetting.fontColor
    }
    
    /// 데이터 전달 메서드
    func putInfoData() {
        guard let name = self.name else { return }
        titleLabel.text = name
        
        guard let overview = self.overview else { return }
        overViewLabel.text = overview
        
        guard let imageString = self.imageString else { return }
        infoImageView.image = UIImage(named: imageString)
    }
    
    /// 시작하기 버튼 클릭 시 동작 구현
    @IBAction func startButtonClicked(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: StoryboardName.Growth.rawValue, bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: GrowthViewController.identifier) as? GrowthViewController else { return }
        let navigationController = UINavigationController(rootViewController: vc)
        
        vc.name = titleLabel.text
        
        UserDefaults.standard.set(self.name!, forKey: UserData.tamagochiName)
        UserDefaults.standard.set(self.imageString!, forKey: UserData.tamagochiImageString)
        
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: false)
    }
    
    ///취소 버튼 클릭 시 동작 구현
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
