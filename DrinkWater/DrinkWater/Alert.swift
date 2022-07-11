//
//  Alert.swift
//  DrinkWater
//
//  Created by sanghyo on 2022/07/07.
//

import Foundation

struct Alert: Codable {
    var id: String = UUID().uuidString
    let date: Date
    var isOn: Bool
    
    var time: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: self.date)
    }
    
    var meridiem: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "a"
        timeFormatter.locale = Locale(identifier: "ko_KR")
        return timeFormatter.string(from: self.date)
    }
}
