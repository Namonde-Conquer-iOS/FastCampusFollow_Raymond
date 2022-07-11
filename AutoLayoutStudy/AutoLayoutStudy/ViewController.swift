//
//  ViewController.swift
//  AutoLayoutStudy
//
//  Created by sanghyo on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapColorChangeButton(_ sender: UIButton) {
        colorView.backgroundColor = UIColor.green
    }
    
}

