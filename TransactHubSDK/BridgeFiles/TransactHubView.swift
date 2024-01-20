//
//  asdf.swift
//  TransactHubSDK
//
//  Created by Abdullah on 20/01/2024.
//

import Foundation
import SwiftUI

 struct TransactHubView: UIViewControllerRepresentable {

    private let config: TransactHubConfig

    private let hostView: any View
    
    public init(config: TransactHubConfig, hostView: any View) {
        self.config = config
        self.hostView = hostView
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        let transactHubStepOne = TransactHubStepOne(config: config)
        //config.delegate = context.coordinator
        config.delegate = hostView as? TransactHubCallback
        let navigationController = UINavigationController(rootViewController: transactHubStepOne)
        navigationController.setNavigationBarHidden(true, animated: true)
        return navigationController
        
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
//    public func makeCoordinator() -> Coordinator {
//        Coordinator(identifierBinding: hostView)
//    }
//
//    public class Coordinator: PayHubDelegate {
//        public func whatStepAreWe(stepName: String) {
//            print("in swiftui bride \(stepName)")
//        }
//
//            let identifierBinding: Binding<AnyView>
//
//            init(identifierBinding: Binding<AnyView>) {
//                self.identifierBinding = identifierBinding
//            }
//
////            func clasificationOccured(_ viewController: ViewController, identifier: String) {
////                // whenever the view controller notifies it's delegate about receiving a new idenfifier
////                // the line below will propagate the change up to SwiftUI
////                identifierBinding.wrappedValue = identifier
////            }
//        }
    
    
}
