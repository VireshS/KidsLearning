//
//  AppMenuItems.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import Foundation
import UIKit

enum AppMenuItems:String, Codable {
    case Colors
    case Fruits
    case Vegetables
    case Vehicles
    case Objects
    case ABCD
    case Numbers
    
    static func allMenus()->[AppMenuItems]
    {
        return [
            Colors,
            Fruits,
            Vegetables,
            Vehicles,
            Objects,
            ABCD,
            Numbers
        ]
    }
    func descriptionText() -> String
    {
        switch self {
        case .Colors:
            return "COLORS"
        case .Fruits:
            return "FRUITS"
        case .Vegetables:
            return "VEGETABLES"
        case .Vehicles:
            return "VEHICLES"
        case .Objects:
            return "OBJECTS"
        case .ABCD:
            return "ABC"
        case .Numbers:
            return "NUMBERS"
        }
    }
    
    func titleImage() -> UIImage
    {
        switch self {
        case .Colors:
            return UIImage(named: "colorsIcon.jpg")!
        case .Fruits:
            return UIImage(named: "FruitsIcon.jpg")!
        case .Vegetables:
            return UIImage(named: "VegsIcon.jpg")!
        case .Vehicles:
            return UIImage(named: "FruitsIcon.jpg")!
        case .Objects:
            return UIImage(named: "FruitsIcon.jpg")!
        case .ABCD:
            return UIImage(named: "FruitsIcon.jpg")!
        case .Numbers:
            return UIImage(named: "FruitsIcon.jpg")!
        }
    }
}
