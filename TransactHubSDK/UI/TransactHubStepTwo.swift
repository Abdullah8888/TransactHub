//
//  TransactHubStepTwo.swift
//  TransactHubSDK
//
//  Created by Abdullah on 20/01/2024.
//

import Foundation
import UIKit

final class TransactHubStepTwo: UIViewController {
   
   let myButton: UIButton = {
       let btn = UIButton()
       btn.translatesAutoresizingMaskIntoConstraints = false
       btn.setTitle("Go back", for: .normal)
       return btn
   }()
   
   private var config: TransactHubConfig
   
    init(config: TransactHubConfig) {
       self.config = config
       super.init(nibName: nil, bundle: nil)
   }
   
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
    override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = .green
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        myButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
   }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("step two is \(String(describing: config.email)) \(String(describing: config.price))")
        config.delegate?.didRecieveMessage(message: "step two")
    }
    
    @objc func goBack() {
        let stepThree = TransactHubStepThree(config: config)
        navigationController?.pushViewController(stepThree, animated: true)
    }
}
