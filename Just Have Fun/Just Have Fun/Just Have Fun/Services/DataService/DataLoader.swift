//
//  FruitsDataLoader.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import Foundation
import UIKit

class DataLoader
{
    class func AllFruits()->[LearningEntity]
    {
        if let path = Bundle.main.path(forResource: "AllFruits", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([LearningEntity].self, from: jsonData)
                    {
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [LearningEntity]()
    }
    
    class func AllColors()->[ColorPalette]
    {
        if let path = Bundle.main.path(forResource: "AllColors", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([ColorPalette].self, from: jsonData)
                    {
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [ColorPalette]()
    }
    
    class func AllVegetables()->[LearningEntity]
    {
        if let path = Bundle.main.path(forResource: "AllVegetables", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([LearningEntity].self, from: jsonData)
                    {
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [LearningEntity]()
    }
    
    
}
