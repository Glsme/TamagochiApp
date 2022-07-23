//
//  SelectCollectionViewCell.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/22.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    static var identifier = "SelectCollectionViewCell"
    
    @IBOutlet weak var selectImageView: UIImageView!
    @IBOutlet weak var selectLabel: UILabel!
    
    func configureCell(data: SelectTamagochi) {
        selectImageView.image = UIImage(named: data.image)
        selectLabel.text = data.name
    }
    
}
