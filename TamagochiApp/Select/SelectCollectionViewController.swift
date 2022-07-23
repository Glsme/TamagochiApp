//
//  SelectCollectionViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/22.
//

import UIKit

class SelectCollectionViewController: UICollectionViewController {
    
    var tamagochiList = TamagochiData()
    
    static var identifier = "SelectCollectionViewController"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setCollectionUI()
    }
    
    func setCollectionUI() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3 , height: width / 3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tamagochiList.tamaghochiData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.identifier, for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell() }
        
        // put data
        let data = tamagochiList.tamaghochiData[indexPath.row]
        cell.configureCell(data: data)
        
        
        
        return cell
    }

}
