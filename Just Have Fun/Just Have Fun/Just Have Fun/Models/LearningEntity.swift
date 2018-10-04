//
//  LearningEntity.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import Foundation
import UIKit

class LearningEntity:Codable
{
    var category:AppMenuItems!
    var name:String = ""
    var image:String = ""
    func Image() -> UIImage? {
        return UIImage(named: self.image)
    }
}

class ColorPalette: Codable {
    var category:AppMenuItems!
    var name:String = ""
    var color:String = ""
    func actualColor() -> UIColor? {
        return ColorPalette.hexStringToUIColor(hex: self.color)
    }
    
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
