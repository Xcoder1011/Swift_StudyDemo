//
//  PrefixHeader.swift
//  SwiftPassValue
//
//  Created by shangkun on 2018/12/16.
//  Copyright © 2018年 wushangkun. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIColor {
    
    convenience init(hex: String) {
        
        self.init(hex: hex, alpha: 1.0)
    }
    
    convenience init(hex: String, alpha:CGFloat) {
        
        var hexstr = hex
        if hexstr.hasPrefix("#") {
            hexstr.remove(at: hexstr.index(of: "#")!)
        }
        
        if hexstr.count != 6 {
            self.init()
            return
        }
        
        let scanner = Scanner.init(string: hexstr)
        scanner.scanLocation = 0
        var rgbvalue: UInt64 = 0
        scanner.scanHexInt64(&rgbvalue)
        
        let r = (rgbvalue & 0xff0000) >> 16
        let g = (rgbvalue & 0xff00) >> 8
        let b = (rgbvalue & 0xff)
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            alpha: alpha)
    }
    
    var toHexString: String {
        
        var r :CGFloat = 0
        var g :CGFloat = 0
        var b :CGFloat = 0
        var a :CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return  String(format: "%02X%02X%02X", Int(r * 0xff), Int(g * 0xff), Int(b * 0xff))
    }
}

extension NSNotification.Name {
    
    /// 通知名字
    public static let PassValueViewControllerPassedValue = NSNotification.Name("PassValueViewControllerPassedValue")

}
