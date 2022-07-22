//
//  SelectCollectionViewController.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/22.
//

import UIKit

class SelectCollectionViewController: UICollectionViewController {
    
    static var identifier = "SelectCollectionViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.identifier, for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }

}
