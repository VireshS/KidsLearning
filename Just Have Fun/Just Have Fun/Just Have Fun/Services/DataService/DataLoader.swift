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
    class func generateJsons()
    {
        /*
         {
            "name": "Green Apple",
            "category": "Fruits",
            "image": "Green_Apple-1.jpg"
        }
        */
        //Images must be names as <first name>_<second name>-<incrementor> example: "Green_Apple-1.jpg"
        
        if let bundlePath = Bundle.main.path(forResource: "Fruits", ofType: "bundle")
        {
            if let bundle = Bundle(path: bundlePath)
            {
                var jsonString = "["
                if let imageURLs = bundle.urls(forResourcesWithExtension: "jpg", subdirectory: "")
                {
                    for singleURL in imageURLs
                    {
                        let imagePath = singleURL.lastPathComponent
                        if(imagePath.contains("Green_Apple-1.jpg"))
                        {
                            print(imagePath)
                        }
                        if let imageName = imagePath.components(separatedBy: "-").first
                        {
                            var validImageName = imageName.replacingOccurrences(of: "_", with: " ")
                            validImageName = validImageName.replacingOccurrences(of: ".jpg", with: "")
                            var singleObject = "{"
                            singleObject = singleObject + "\"name\":\"\(validImageName)\","
                            singleObject = singleObject + "\"category\":\"Fruits\","
                            singleObject = singleObject + "\"image\":\"\(imagePath)\""
                            singleObject = singleObject + "},"
                            jsonString = jsonString + singleObject
                        }
                        
                    }
                    
                }
                jsonString.removeLast()
                jsonString = jsonString + "]"
                print(jsonString)
            }
        }
        
        
        
    }
    class func AllFruits()->[LearningEntity]
    {
        DataLoader.generateJsons()
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
