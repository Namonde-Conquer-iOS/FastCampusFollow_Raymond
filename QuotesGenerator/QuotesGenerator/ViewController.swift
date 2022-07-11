//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by sanghyo on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quotes = QuoteController.mockData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func quoteGeneratorButton(_ sender: UIButton) {
        let random = Int(arc4random_uniform(4))
        quoteLabel.text = quotes[random].contents
        nameLabel.text = quotes[random].name
        
    }
    
}

