//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by sanghyo on 2022/06/27.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    var text: String?
    var textColor = UIColor.yellow
    var backgroundColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    @IBAction func tapTextColorButton(_ sender: UIButton) {
        switch sender {
        case self.yellowButton:
            changeTextColor(color: .yellow)
            textColor = .yellow
        case self.purpleButton:
            changeTextColor(color: .purple)
            textColor = .purple
        case self.greenButton:
            changeTextColor(color: .green)
            textColor = .green
        default:
            return
        }
    }
    
    @IBAction func tapBackgroundColorButton(_ sender: UIButton) {
        switch sender {
        case self.blackButton:
            changeBackgroundColor(color: .black)
            backgroundColor = .black
        case self.blueButton:
            changeBackgroundColor(color: .blue)
            backgroundColor = .blue
        case self.redButton:
            changeBackgroundColor(color: .red)
            backgroundColor = .red
        default:
            return
        }
    }
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(text: textField.text, textColor: textColor, backgroundColor: backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor){
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
        
    }
    
    private func changeBackgroundColor(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.redButton.alpha = color == UIColor.red ? 1 : 0.2
    }
    
    private func configureView() {
        guard let text = text else { return }
        textField.text = text
        changeTextColor(color: textColor)
        changeBackgroundColor(color: backgroundColor)
    }
}
