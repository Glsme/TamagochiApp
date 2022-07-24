//
//  SelectCollectionViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/22.
//

import UIKit

///다마고치 선택화면 Controller
class SelectCollectionViewController: UICollectionViewController {

    static var identifier = "SelectCollectionViewController"
    
    var tamagochiList = TamagochiData()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UISetting.fontColor, .font: UIFont.systemFont(ofSize: 14, weight: .semibold)]
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
        cell.selectLabel.layer.backgroundColor = UISetting.backgroundColor.cgColor
        cell.selectLabel.textColor = UISetting.fontColor
        cell.selectLabel.layer.borderWidth = 1
        cell.selectLabel.layer.borderColor = UISetting.fontColor.cgColor
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        


        if indexPath.row < tamagochiList.tamaghochiData.count {
            let storyBorad = UIStoryboard(name: "Select", bundle: nil)
            guard let vc = storyBorad.instantiateViewController(withIdentifier: TamagochiInfoViewController.identifier) as? TamagochiInfoViewController else { return }
            
            vc.name = tamagochiList.tamaghochiData[indexPath.row].name
            vc.overview = tamagochiList.tamaghochiData[indexPath.row].overView
            vc.imageString = tamagochiList.tamaghochiData[indexPath.row].image
            
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)

        }
        
    }

}
