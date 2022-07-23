//
//  TamagochiData.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/23.
//

import Foundation

struct TamagochiData {
    let tamaghochiData: [SelectTamagochi] = [
        SelectTamagochi(name: "따끔따끔 다마고치", image: "1-6"),
        SelectTamagochi(name: "방실방실 다마고치", image: "2-6"),
        SelectTamagochi(name: "반짝반짝 다마고치", image: "3-6")
    ]
    
    let preparingData = SelectTamagochi(name: "준비중이에요", image: "noImage")
}
