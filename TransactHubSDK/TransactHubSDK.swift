//
//  TransactHubSDK.swift
//  TransactHubSDK
//
//  Created by Abdullah on 20/01/2024.
//

import Foundation
import SwiftUI

protocol TransactHubSDKDelegate {
    associatedtype Content: View
    func launch(hostView: any View) -> Content
    func launch(presentingViewController: UIViewController)
}

public class TransactHubSDK: TransactHubSDKDelegate {
    
    /// Use TransactHubConfig to setup your configuration
    public var config: TransactHubConfig?
    
    public init() {
        print("lalalalal")
        UIFont.registerAll(fontFileNames: Constants.fontNames, bundle: Bundle(identifier: Constants.bundleIdentifier)!)
        
//        UIFont.jbs_registerFont(
//            withFilenameString: "Poppins-ExtraBold.ttf",
//            bundle: Bundle(identifier: "com.myapp.TransactHubSDK")!
//        )
//
//        UIFont.jbs_registerFont(
//            withFilenameString: "Poppins-ExtraBoldItalic.ttf",
//            bundle: Bundle(identifier: "com.myapp.TransactHubSDK")!
//        )
    }
    
    /// This method will be use to launch the sdk in Swiftui
    /// - Parameters:
    ///   - config: TransactHubConfig
    ///   - hostView: any View
    /// - Returns: some View
    public func launch(hostView: any View) -> some View {
        TransactHubView(config: config!, hostView: hostView)
    }
    
    /// This method will be use to launch the sdk in UIKit
    /// - Parameter presentingViewController: UIViewController
    public func launch( presentingViewController: UIViewController) {
        let transactHubStepOne = TransactHubStepOne(config: config!)
        //payHub.delegate = delegate
        let navigationController = UINavigationController(rootViewController: transactHubStepOne)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.setNavigationBarHidden(true, animated: true)
        presentingViewController.present(navigationController, animated: true, completion: nil)
    }
}
