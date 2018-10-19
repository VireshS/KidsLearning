//
//  AppMenuItems.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import Foundation
import UIKit
class AppMenuListItem
{
    var menuMode:AppMenuItems = .Colors
    var menuEntity:AnyObject  = DataLoader.sharedDataLoader.AllColors().first!
}

class AppMenu {
    private static var sharedInstance:AppMenu? = nil
    
    private var allMenu = [AppMenuListItem]()
    class func sharedMenu()->AppMenu
    {
        if(sharedInstance == nil)
        {
            sharedInstance = AppMenu()
        }
        if(sharedInstance!.allMenu.count<=0)
        {
            for item in sharedInstance!.allMenuModeEnumValues()
            {
                switch item {
                case .Colors:
                    let mapping = AppMenuListItem()
                    mapping.menuMode = item
                    if let firstItem = DataLoader.sharedDataLoader.AllColors().first
                    {
                        mapping.menuEntity = firstItem
                    }
                    sharedInstance?.allMenu.append(mapping)
                case .Fruits:
                    let mapping = AppMenuListItem()
                    mapping.menuMode = item
                    if let firstItem = DataLoader.sharedDataLoader.AllFruits().first
                    {
                        mapping.menuEntity = firstItem
                    }
                    sharedInstance?.allMenu.append(mapping)
                case .Vegetables:
                    let mapping = AppMenuListItem()
                    mapping.menuMode = item
                    if let firstItem = DataLoader.sharedDataLoader.AllVegetables().first
                    {
                        mapping.menuEntity = firstItem
                    }
                    sharedInstance?.allMenu.append(mapping)
                case .Vehicles:
                    let mapping = AppMenuListItem()
                    mapping.menuMode = item
                    if let firstItem = DataLoader.sharedDataLoader.AllVegetables().first
                    {
                        mapping.menuEntity = firstItem
                    }
                    sharedInstance?.allMenu.append(mapping)
                case .Objects:
                    let mapping = AppMenuListItem()
                    mapping.menuMode = item
                    if let firstItem = DataLoader.sharedDataLoader.AllObjects().first
                    {
                        mapping.menuEntity = firstItem
                    }
                    sharedInstance?.allMenu.append(mapping)
                case .ABCD:
//                    if let firstItem = DataLoader.sharedDataLoader.alla().first
//                    {
//                        sharedInstance.menuEntityMappings[item] = firstItem
//                    }
                    print("")
                case .Numbers:
//                    if let firstItem = DataLoader.sharedDataLoader.AllColors().first
//                    {
//                        sharedInstance.menuEntityMappings[item] = firstItem
//                    }
                    print("")
                case .Animals:
                    let mapping = AppMenuListItem()
                    mapping.menuMode = item
                    if let firstItem = DataLoader.sharedDataLoader.AllAnimals().first
                    {
                        mapping.menuEntity = firstItem
                    }
                    sharedInstance?.allMenu.append(mapping)
                case .Flowers:
                    let mapping = AppMenuListItem()
                    mapping.menuMode = item
                    if let firstItem = DataLoader.sharedDataLoader.AllFruits().first
                    {
                        mapping.menuEntity = firstItem
                    }
                    sharedInstance?.allMenu.append(mapping)
                case .Settings:
//                    if let firstItem = DataLoader.sharedDataLoader.AllColors().first
//                    {
//                        sharedInstance.menuEntityMappings[item] = firstItem
//                    }
                    print("")
                }
            }
        }
        return sharedInstance!
    }
    
    func allMenus() -> [AppMenuListItem]
    {
        return self.allMenu
    }
    
    func allMenuModeEnumValues() -> [AppMenuItems] {
        return AppMenuItems.allMenus()
    }
    
    func updateEntity(for newMode:AppMenuItems, entity:AnyObject)
    {
        for menu in AppMenu.sharedMenu().allMenus() {
            if(menu.menuMode == newMode)
            {
                menu.menuEntity = entity
                break
            }
        }
    }
    
    func updateCurrentMenuMode(toMode mode:AppMenuItems)
    {
        var menuItemSelected:AppMenuListItem? = nil
        var index:Int = -1
        for menu in AppMenu.sharedMenu().allMenus() {
            index = index + 1
            if(menu.menuMode == mode)
            {
                menuItemSelected = menu
                break
            }
        }
        if(menuItemSelected != nil)
        {
            AppMenu.sharedMenu().allMenu.remove(at: index)
            AppMenu.sharedMenu().allMenu.insert(menuItemSelected!, at: 0)
        }
    }
    
    func entity(for menuMode:AppMenuItems)->AnyObject?
    {
        for menu in AppMenu.sharedMenu().allMenus() {
            if(menu.menuMode == menuMode)
            {
                return menu.menuEntity
            }
        }
        return nil
    }
}


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
