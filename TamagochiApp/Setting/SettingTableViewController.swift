//
//  SettingTableViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var userName = "대장"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UISetting.fontColor
        
        if UserDefaults.standard.string(forKey: "userName") == nil || UserDefaults.standard.string(forKey: "userName") == "" {
            UserDefaults.standard.set("대장", forKey: "userName")
        } else {
            self.userName = UserDefaults.standard.string(forKey: "userName")!
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditiingTableViewCell") else { return UITableViewCell() }
            cell.detailTextLabel?.text = "\(userName)"
            cell.detailTextLabel?.textColor = UISetting.fontColor
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangingTableViewCell") else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InitTableViewCell") else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
            

        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            showInitAlert()
        } else if indexPath.row == 1 {
            let storyBoard = UIStoryboard(name: "Select", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: SelectCollectionViewController.identifier) as! SelectCollectionViewController
            
//            let navigationController = UINavigationController(rootViewController: vc)
            vc.navigationItem.title = "다마고치 변경하기"
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func showInitAlert() {
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "웅", style: .default) { action in
            self.initData()
            self.changeView()
        }
        let cancelAction = UIAlertAction(title: "아냐!", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }

    func changeView() {
        let storyBoard = UIStoryboard(name: "Select", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: SelectCollectionViewController.identifier) as! SelectCollectionViewController
        let navigationController = UINavigationController(rootViewController: vc)
        
        navigationController.modalPresentationStyle = .overFullScreen
        self.present(navigationController, animated: true)
    }
    
    func initData() {
        UserDefaults.standard.removeObject(forKey: "rice")
        UserDefaults.standard.removeObject(forKey: "water")
        UserDefaults.standard.removeObject(forKey: "level")
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "tamagochiImageString")
        UserDefaults.standard.removeObject(forKey: "tamagochiName")
        UserDefaults.standard.removeObject(forKey: "First")
        
    }
}
