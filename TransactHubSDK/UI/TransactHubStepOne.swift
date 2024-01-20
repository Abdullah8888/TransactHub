//
//  TransactHubStepOne.swift
//  TransactHubSDK
//
//  Created by Abdullah on 20/01/2024.
//

import Foundation
import UIKit

final class TransactHubStepOne: UIViewController {
    
    let myButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go to next", for: .normal)
        return btn
    }()
    
    private var config: TransactHubConfig
    
    public init(config: TransactHubConfig) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        myButton.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("step one is \(String(describing: config.email)) \(String(describing: config.price))")
        config.delegate?.didRecieveMessage(message: "step root")
    }
    
    @objc func goToNext() {
        let stepTwo = TransactHubStepTwo(config: config)
//        stepTwo.modalTransitionStyle = .crossDissolve
//        stepTwo.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(stepTwo, animated: true)
    }
}
