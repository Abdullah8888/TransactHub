//
//  ViewController.swift
//  UIKitExample
//
//  Created by Abdullah on 20/01/2024.
//

import UIKit
import TransactHubSDK

class ViewController: UIViewController, TransactHubCallback {
    
    lazy var transactHubSDK = TransactHubSDK()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickMe(_ sender: UIButton) {
        let config = TransactHubConfig()
        config.price = "20"
        config.email = "email"
        config.delegate = self
        
        transactHubSDK = TransactHubSDK()
        transactHubSDK.config = config
        transactHubSDK.launch(presentingViewController: self)
        
    }
    
    func didRecieveMessage(message: String) {
        print("UIKit => \(message)")
    }
}

