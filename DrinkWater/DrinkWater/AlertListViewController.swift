//
//  AlertListViewController.swift
//  DrinkWater
//
//  Created by sanghyo on 2022/07/07.
//

import UIKit
import UserNotifications

class AlertListViewController: UITableViewController {
    var alertList = [Alert]()
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "AlertListCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "AlertListCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alertList = self.loadAlertList()
    }
    
    @IBAction func addAlertButtonAction(_ sender: UIBarButtonItem) {
        guard let addAlertVC = storyboard?.instantiateViewController(identifier: "AddAlertViewController") as? AddAlertViewController else { return }
        addAlertVC.pickedData = {[weak self] date in
            guard let self = self else { return }
            
            //var alertList = self.loadAlertList()
            let newAlert = Alert(date: date, isOn: true)
            
            self.alertList.append(newAlert)
            self.alertList.sort {
                $0.date.compare($1.date) == .orderedAscending
            }
            
            //self.alertList = alertList
            self.saveAlertList()
            self.userNotificationCenter.addNotificationRequest(by: newAlert)
            self.tableView.reloadData()
        }
        self.present(addAlertVC, animated: true, completion: nil)
    }
    
    private func loadAlertList() -> [Alert] {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.value(forKey: "alertList") as? Data,
              let alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return [] }
        
        return alerts
    }
    
    private func saveAlertList() {
        let userDefaults = UserDefaults.standard
        let data = try? PropertyListEncoder().encode(self.alertList)
        userDefaults.set(data, forKey: "alertList")
    }
}

extension AlertListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.alertList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlertListCell", for: indexPath) as? AlertListCell else { return UITableViewCell() }
        let rowIndex = indexPath.row
        
        cell.meridiemLabel.text = alertList[rowIndex].meridiem
        cell.timeLabel.text = alertList[rowIndex].time
        cell.alertSwitch.isOn = alertList[rowIndex].isOn
        cell.alertSwitch.tag = rowIndex
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "물 마실 시간"
        default:
            return nil
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.alertList.remove(at: indexPath.row)
            self.saveAlertList()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [alertList[indexPath.row].id])
            //self.tableView.reloadData()
        default:
            break
        }
    }
}
