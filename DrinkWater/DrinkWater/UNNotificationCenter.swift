//
//  UNNotificationCenter.swift
//  DrinkWater
//
//  Created by sanghyo on 2022/07/08.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest(by alert: Alert) {
        let content = UNMutableNotificationContent()
        content.title = "물 마실 시간이에요"
        content.body = "세계 보건 기구(WHO)가 권장하는 하루 물 섭취량은 1.5~2리터에요"
        content.badge = 1
        content.sound = .default
        
        let dateComponent = Calendar.current.dateComponents([.hour, .minute], from: alert.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: alert.id, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
        
        
    }
}
