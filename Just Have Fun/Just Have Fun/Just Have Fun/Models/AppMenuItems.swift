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
    case Animals
    case Flowers
    case Settings
    
    static func allMenus()->[AppMenuItems]
    {
        return [
            Colors,
            Fruits,
            Vegetables,
            Objects,
            Vehicles,
            Animals,
            Flowers,
            ABCD,
            Numbers,
            Settings
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
        case .Animals:
            return "ANIMALS"
        case .Settings:
            return "SETTINGS"
        case .Flowers:
            return "FLOWERS"
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
            return UIImage(named: "Vehicles.jpg")!
        case .Objects:
            return UIImage(named: "objects.jpg")!
        case .ABCD:
            return UIImage(named: "FruitsIcon.jpg")!
        case .Numbers:
            return UIImage(named: "FruitsIcon.jpg")!
        case .Animals:
            return UIImage(named: "animal.jpg")!
        case .Flowers:
            return UIImage(named: "Flower.jpg")!
        case .Settings:
            return UIImage(named: "Settings")!
        }
        
    }
}
