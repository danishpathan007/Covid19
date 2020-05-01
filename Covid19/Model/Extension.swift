//
//  Extension.swift
//  COVID19 - Statics
//
//  Created by Danish Khan on 30/04/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

extension Int{
    func formatNumber() -> String{
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension Int64{
    func formatNumber() -> String{
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension Double {
    func string(maximumFractionDigits: Int = 2) -> String {
        let s = String(format: "%.\(maximumFractionDigits)f", self)
        for i in stride(from: 0, to: -maximumFractionDigits, by: -1) {
            if s[s.index(s.endIndex, offsetBy: i - 1)] != "0" {
                return String(s[..<s.index(s.endIndex, offsetBy: i)])
            }
        }
        return String(s[..<s.index(s.endIndex, offsetBy: -maximumFractionDigits - 1)])
    }
}

// MARK: - Loader
class Loader {
    
    class func configure() {
        SVProgressHUD.setDefaultMaskType(.gradient)
        SVProgressHUD.setDefaultStyle(.light)
        SVProgressHUD.setBackgroundColor(.clear)
        SVProgressHUD.setRingThickness(4.0)
        SVProgressHUD.setRingRadius(25.0)
        SVProgressHUD.setForegroundColor(UIColor.themeGreenColor())
        SVProgressHUD.setBackgroundLayerColor(UIColor.themeGreenColor())
    }
    
    class func show() {
        SVProgressHUD.show()
    }
    
    class func hide() {
        SVProgressHUD.dismiss()
    }
    
    class func show(progress: Float, with title: String? = nil) {
        SVProgressHUD.setRingRadius(25.0)
        SVProgressHUD.showProgress(progress / 100, status: title)
    }
    
}


extension UIColor {
    class func colorWith(hexValue: UInt,alpha:CGFloat = 1) -> UIColor {
        return UIColor(
            red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}


extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }
    class func themeGreenColor()->UIColor{
           //UIColor.init(red: 63/255, green: 149/255, blue: 84/255, alpha: 1.0)
        return UIColor.init(hex: 0x81C98A)
      }
    
    class func buttonBackgroundColor() -> UIColor{
        return UIColor.init(hex: 0x169149)
    }
    
    class func textFieldGreenColor() -> UIColor {
        //return UIColor.init(red: 63/255, green: 149/255, blue: 84/255, alpha: 1.0)
        return UIColor.init(hex: 0x81C98A)
    }
      
    class func calendarTodayColor() -> UIColor{
        return UIColor.init(hex: 0x3F9554)
    }
    
    class func calendarSelectionColor() -> UIColor{
        return UIColor.init(hex: 0xC6C6C8)
    }
    
   convenience init(hex: Int) {
       self.init(
           red: (hex >> 16) & 0xFF,
           green: (hex >> 8) & 0xFF,
           blue: hex & 0xFF
       )
   }
}


