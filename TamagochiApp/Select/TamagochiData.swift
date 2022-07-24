//
//  TamagochiData.swift
//  TamagochiApp
//
//  Created by Seokjune Hong on 2022/07/23.
//

import Foundation

struct TamagochiData {
    let tamaghochiData: [SelectTamagochi] = [
        SelectTamagochi(name: "따끔따끔 다마고치", image: "1-6", overView: "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g이에요. \n성격은 소심하지만 마음은 따뜻해요. \n열심히 잘 먹고 잘 클 자신은 있답니다. \n반가워요 주인님!!"),
        SelectTamagochi(name: "방실방실 다마고치", image: "2-6", overView: "저는 방실방실 다마고치입니당 \n키는 100Km 몸무게는 150톤이에욤 \n성격은 화끈하고 날라다닙니당~! \n열심히 잘 먹고 잘 클 자신은 있답니당 \n방실방실!"),
        SelectTamagochi(name: "반짝반짝 다마고치", image: "3-6", overView: "저는 반짝반짝 다마고치입니다.")
    ]
    
    let preparingData = SelectTamagochi(name: "준비중이에요", image: "noImage", overView: "준비중이에요 추후 업데이트까지 기다려주세요")
}
