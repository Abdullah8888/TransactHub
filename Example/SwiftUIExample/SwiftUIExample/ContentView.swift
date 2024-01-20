//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Abdullah on 20/01/2024.
//

import SwiftUI
import TransactHubSDK

struct ContentView: View {
    @State var isTransactHubSDKPresented = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Click me") {
                isTransactHubSDKPresented = true
            }
            .fullScreenCover(isPresented: $isTransactHubSDKPresented) {
                makePayHuBSDK()
            }
        }
        .padding()
    }
    
    func makePayHuBSDK () -> some View {
        
        let transactHubSDK = TransactHubSDK()
        
        let config = TransactHubConfig()
        config.email = "swiftui email"
        config.price = "swiftui price"
        
        transactHubSDK.config = config
        return transactHubSDK.launch(hostView: self)
            .edgesIgnoringSafeArea(.all)
    }
}

extension ContentView: TransactHubCallback {
    
    func didRecieveMessage(message: String) {
        print("SwiftUI => \(message)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
