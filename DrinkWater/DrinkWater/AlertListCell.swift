//
//  AlertListCell.swift
//  DrinkWater
//
//  Created by sanghyo on 2022/07/07.
//

import UIKit
import UserNotifications

class AlertListCell: UITableViewCell {    
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    //직접 인스턴스를 만들지 않고 current를 이용하여 객체를 가져옴
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func loadData() -> [Alert] {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.value(forKey: "alertList") as? Data,
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return [] }
        return alerts
    }
    
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard

        var alertList = self.loadData()
        alertList[sender.tag].isOn = sender.isOn
        let data = try? PropertyListEncoder().encode(alertList)
        userDefaults.set(data, forKey: "alertList")
        
        if sender.isOn {
            userNotificationCenter.addNotificationRequest(by: alertList[sender.tag])
        } else {
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alertList[sender.tag].id])
        }
    }
}
