//
//  SeguePushViewController.swift
//  ScreenTransactionExample
//
//  Created by sanghyo on 2022/06/23.
//

import UIKit

class SeguePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = name
        // Do any additional setup after loading the view.
    }
    @IBAction func tapBackcButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
