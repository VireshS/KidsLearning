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
        
        var fruitsJsonString = "["
        if let bundlePath = Bundle.main.path(forResource: "Fruits", ofType: "bundle")
        {
            if let bundle = Bundle(path: bundlePath)
            {
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
                            fruitsJsonString = fruitsJsonString + singleObject
                        }
                        
                    }
                    
                }
                fruitsJsonString.removeLast()
                fruitsJsonString = fruitsJsonString + "]"
                print(fruitsJsonString)
            }
        }
        
        
        
        
        
        
        
        var animalsJsonString = "["
        if let bundlePath = Bundle.main.path(forResource: "Animals", ofType: "bundle")
        {
            if let bundle = Bundle(path: bundlePath)
            {
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
                            singleObject = singleObject + "\"category\":\"Animals\","
                            singleObject = singleObject + "\"image\":\"\(imagePath)\""
                            singleObject = singleObject + "},"
                            animalsJsonString = animalsJsonString + singleObject
                        }
                        
                    }
                    
                }
                animalsJsonString.removeLast()
                animalsJsonString = animalsJsonString + "]"
                print(animalsJsonString)
            }
        }
        
        
        
        
        var flowersJsonString = "["
        if let bundlePath = Bundle.main.path(forResource: "Flowers", ofType: "bundle")
        {
            if let bundle = Bundle(path: bundlePath)
            {
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
                            singleObject = singleObject + "\"category\":\"Flowers\","
                            singleObject = singleObject + "\"image\":\"\(imagePath)\""
                            singleObject = singleObject + "},"
                            flowersJsonString = flowersJsonString + singleObject
                        }
                        
                    }
                    
                }
                flowersJsonString.removeLast()
                flowersJsonString = flowersJsonString + "]"
                print(flowersJsonString)
            }
        }
        
        
        
        var objectsJsonString = "["
        if let bundlePath = Bundle.main.path(forResource: "Objects", ofType: "bundle")
        {
            if let bundle = Bundle(path: bundlePath)
            {
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
                            singleObject = singleObject + "\"category\":\"Objects\","
                            singleObject = singleObject + "\"image\":\"\(imagePath)\""
                            singleObject = singleObject + "},"
                            objectsJsonString = objectsJsonString + singleObject
                        }
                        
                    }
                    
                }
                objectsJsonString.removeLast()
                objectsJsonString = objectsJsonString + "]"
                print(objectsJsonString)
            }
        }
        
        
        
        
        var vegJsonString = "["
        if let bundlePath = Bundle.main.path(forResource: "Vegetables", ofType: "bundle")
        {
            if let bundle = Bundle(path: bundlePath)
            {
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
                            singleObject = singleObject + "\"category\":\"Vegetables\","
                            singleObject = singleObject + "\"image\":\"\(imagePath)\""
                            singleObject = singleObject + "},"
                            vegJsonString = vegJsonString + singleObject
                        }
                        
                    }
                    
                }
                vegJsonString.removeLast()
                vegJsonString = vegJsonString + "]"
                print(vegJsonString)
            }
        }
        
        
        
        
    }
    class func AllFruits()->[LearningEntity]
    {
        if let path = Bundle.main.path(forResource: "Fruits", ofType: "json") {
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
        if let path = Bundle.main.path(forResource: "Colors", ofType: "json") {
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
        if let path = Bundle.main.path(forResource: "Vegetables", ofType: "json") {
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
    
    class func AllAnimals()->[LearningEntity]
    {
        if let path = Bundle.main.path(forResource: "Animals", ofType: "json") {
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
    
    
    class func AllFlowers()->[LearningEntity]
    {
        if let path = Bundle.main.path(forResource: "Flowers", ofType: "json") {
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
    
    
    class func AllObjects()->[LearningEntity]
    {
        if let path = Bundle.main.path(forResource: "Objects", ofType: "json") {
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
