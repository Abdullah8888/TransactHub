//
//  TransactHubStepOne.swift
//  TransactHubSDK
//
//  Created by Abdullah on 20/01/2024.
//

import Foundation
import UIKit
public class ImageProvider {
    // convenient for specific image
    public static func picture() -> UIImage {
        return UIImage(named: "picture", in: Bundle(for: self), with: nil) ?? UIImage()
    }

    // for any image located in bundle where this class has built
    public static func image(named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle(for: self), with: nil)
    }
}
final class TransactHubStepOne: UIViewController {
    
    let myButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Go to next", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Poppins-ExtraBold", size: 20)
        return btn
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let myLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imggg: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .yellow
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
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
        //UIFont.registerFonts
        //try? UIFont.register(path: "Resources", fileNameString: "Poppins-ExtraBold", type: ".ttf")
        
//        UIFont.jbs_registerFont(
//            withFilenameString: "Poppins-ExtraBold.ttf",
//            bundle: Bundle(identifier: "com.myapp.TransactHubSDK")!
//        )
//        
//        UIFont.jbs_registerFont(
//            withFilenameString: "Poppins-ExtraBoldItalic.ttf",
//            bundle: Bundle(identifier: "com.myapp.TransactHubSDK")!
//        )
        
        UIFont.familyNames.forEach { (font) in
            print("Family Name: \(font)")
            UIFont.fontNames(forFamilyName: font).forEach({
                print("--Font Name: \($0)")
            })
        }
        view.backgroundColor = .red
        view.addSubview(imggg)
        view.addSubview(myButton)
        view.addSubview(myLabel)
        view.addSubview(myLabel2)
        NSLayoutConstraint.activate([
            imggg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imggg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imggg.heightAnchor.constraint(equalToConstant: 120),
            imggg.widthAnchor.constraint(equalToConstant: 120),
            
            myButton.topAnchor.constraint(equalTo: imggg.bottomAnchor, constant: 20),
            myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: myButton.trailingAnchor, constant: 20),
            
            myLabel.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 20),
            myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: myLabel.trailingAnchor, constant: 20),
            
            myLabel2.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 20),
            myLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: myLabel2.trailingAnchor, constant: 20),
        ])
        imggg.image = UIImage(named: "lala", in: Bundle(for: TransactHubStepOne.self), with: nil)
        myLabel.font = UIFont(name: "Poppins-ExtraBold", size: 17)
        myLabel.text = "Lqlqlqlq"
        
        myLabel2.font = UIFont(name: "Poppins-ExtraBoldItalic", size: 17)
        myLabel2.text = "Banan"
       // myButton.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
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
