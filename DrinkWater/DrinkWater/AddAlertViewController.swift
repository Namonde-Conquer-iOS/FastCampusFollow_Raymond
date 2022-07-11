//
//  AddAlertViewController.swift
//  DrinkWater
//
//  Created by sanghyo on 2022/07/07.
//

import UIKit

class AddAlertViewController: UIViewController {
    var pickedData: ((_ date: Date) -> Void)?

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedData?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
