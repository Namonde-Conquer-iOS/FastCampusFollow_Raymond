//
//  ViewController.swift
//  LEDBoard
//
//  Created by sanghyo on 2022/06/27.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {

    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentsLabel.textColor = UIColor.yellow
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SettingViewController {
            viewController.delegate = self
            viewController.text = self.contentsLabel.text
            viewController.textColor = self.contentsLabel.textColor
            viewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        guard let text = text else { return }
        contentsLabel.text = text
        contentsLabel.textColor = textColor
        view.backgroundColor = backgroundColor
    }

}

