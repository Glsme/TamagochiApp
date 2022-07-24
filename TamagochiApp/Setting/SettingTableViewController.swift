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
        print(indexPath.row)
    }

}
