//
//  TransactHubCallback.swift
//  TransactHubSDK
//
//  Created by Abdullah on 20/01/2024.
//

import Foundation
public protocol TransactHubCallback {
    func didRecieveMessage(message: String)
}
