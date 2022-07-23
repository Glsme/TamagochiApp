//
//  SelectCollectionViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/22.
//

import UIKit

///다마고치 선택화면 Controller
class SelectCollectionViewController: UICollectionViewController {

    var tamagochiList = TamagochiData()
    
    static var identifier = "SelectCollectionViewController"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionUI()
    }
    
    func setCollectionUI() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3 , height: (width / 3) * 1.1)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        tamagochiList.tamaghochiData.count
        21
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.identifier, for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell() }
        
        // put data
        if tamagochiList.tamaghochiData.count - indexPath.row > 0 {
            let data = tamagochiList.tamaghochiData[indexPath.row]
            cell.configureCell(data: data)
        } else {
            let data = tamagochiList.preparingData
            cell.configureCell(data: data)
        }
        
        // UI setting
        cell.selectLabel.font = .systemFont(ofSize: 13, weight: .regular)
        cell.selectLabel.layer.cornerRadius = 2
        cell.selectLabel.layer.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1).cgColor
        cell.selectLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        cell.selectLabel.layer.borderWidth = 1
        cell.selectLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        return cell
    }

}
