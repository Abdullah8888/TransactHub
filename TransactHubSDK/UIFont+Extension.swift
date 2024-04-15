//
//  UIFont+Extension.swift
//  TransactHubSDK
//
//  Created by Abdullah on 23/01/2024.
//

import Foundation

import UIKit

enum RegisterFontError: Error {
  case invalidFontFile
  case fontPathNotFound
  case initFontError
  case registerFailed
}
class GetBundle {}
extension UIFont {
    static var registerFonts:  Void {
        try? UIFont.register(path: "Resources/Poppins", fileNameString: "Poppins-ExtraBold", type: ".ttf")

    }
    
static func register(path: String, fileNameString: String, type: String) throws {
    print("path is \(path), filename \(fileNameString) tyeo \(type)")
  let frameworkBundle = Bundle(for: GetBundle.self)
  guard let resourceBundleURL = frameworkBundle.path(forResource: path + "/" + fileNameString, ofType: type) else {
     throw RegisterFontError.fontPathNotFound
  }
  guard let fontData = NSData(contentsOfFile: resourceBundleURL),    let dataProvider = CGDataProvider.init(data: fontData) else {
    throw RegisterFontError.invalidFontFile
  }
  guard let fontRef = CGFont.init(dataProvider) else {
     throw RegisterFontError.initFontError
  }
  var errorRef: Unmanaged<CFError>? = nil
 guard CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) else   {
       throw RegisterFontError.registerFailed
  }
 }
}

extension UIFont {

    static func nunitosSansBold(size: CGFloat = 14) -> UIFont { UIFont(name: "NunitoSans-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }

    static func nunitoSansRegular(size: CGFloat = 14) -> UIFont { UIFont(name: "NunitoSans-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    static func nunitoSansSemiBold(size: CGFloat = 14) -> UIFont { UIFont(name: "NunitoSans-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size) }

    static func poppinsExtraBold(size: CGFloat = 14) -> UIFont { UIFont(name: "Poppins-ExtraBold", size: size)! }
}

extension CGSize {
    
    init(height: CGFloat) {
        self.init(width: 0, height: height)
    }
    
    init(width: CGFloat) {
        self.init(width: width, height: 0)
    }
}

 extension UIFont {
     
     static func registerAll(fontFileNames: [String], bundle: Bundle) {
//         for el in fontFileNames {
//
//         }
         //fontFileNames.forEach {jbs_registerFont(withFilenameString: $0, bundle: bundle)}
//         jbs_registerFont(withFilenameString: fontFileNames.first!, bundle: bundle)
//         jbs_registerFont(withFilenameString: fontFileNames[1], bundle: bundle)
         
         jbs_registerFont(
             withFilenameString: "Poppins-ExtraBold.ttf",
             bundle: bundle
         )
         
         jbs_registerFont(
             withFilenameString: "Poppins-ExtraBoldItalic.ttf",
             bundle: bundle
         )
         
     }

     static func jbs_registerFont(withFilenameString filenameString: String, bundle: Bundle) {
         print(" filename \(filenameString) bundle \(bundle)")
        guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
            print("UIFont+:  Failed to register font - path for resource not found.")
            return
        }

        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            print("UIFont+:  Failed to register font - font data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("UIFont+:  Failed to register font - data provider could not be loaded.")
            return
        }

        guard let font = CGFont(dataProvider) else {
            print("UIFont+:  Failed to register font - font could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>? = nil
        if (CTFontManagerRegisterGraphicsFont(font, &errorRef) == false) {
            print("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }

}
