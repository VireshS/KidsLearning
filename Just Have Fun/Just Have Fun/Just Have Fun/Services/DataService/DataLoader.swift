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
    static var sharedDataLoader:DataLoader = DataLoader()
    class func defaultLoader() -> DataLoader
    {
        return sharedDataLoader
    }
    
    
    
    private var allFruits = [LearningEntity]()
    private var allColors = [ColorPalette]()
    private var allVegetables = [LearningEntity]()
    private var allAnimals = [LearningEntity]()
    private var allFlowers = [LearningEntity]()
    private var allObjects = [LearningEntity]()
    
    
    final func AllFruits()->[LearningEntity]
    {
        if(self.allFruits.count>0)
        {
            return self.allFruits
        }
        if let path = Bundle.main.path(forResource: "Fruits", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([LearningEntity].self, from: jsonData)
                    {
                        self.allFruits = entityObject
                        self.allFruits.shuffle()
                        return self.allFruits
                    }
                }
            } catch {
            }
        }
        return [LearningEntity]()
    }
    
    final func AllColors()->[ColorPalette]
    {
        if(self.allColors.count>0)
        {
            return self.allColors
        }
        if let path = Bundle.main.path(forResource: "Colors", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([ColorPalette].self, from: jsonData)
                    {
                        self.allColors = entityObject
                        self.allColors.shuffle()
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [ColorPalette]()
    }
    
    final func AllVegetables()->[LearningEntity]
    {
        if(self.allVegetables.count>0)
        {
            return self.allVegetables
        }
        if let path = Bundle.main.path(forResource: "Vegetables", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([LearningEntity].self, from: jsonData)
                    {
                        self.allVegetables = entityObject
                        self.allVegetables.shuffle()
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [LearningEntity]()
    }
    
    final func AllAnimals()->[LearningEntity]
    {
        if(self.allAnimals.count>0)
        {
            return self.allAnimals
        }
        if let path = Bundle.main.path(forResource: "Animals", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([LearningEntity].self, from: jsonData)
                    {
                        self.allAnimals = entityObject
                        self.allAnimals.shuffle()
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [LearningEntity]()
    }
    
    
    final func AllFlowers()->[LearningEntity]
    {
        if(self.allFlowers.count>0)
        {
            return self.allFlowers
        }
        if let path = Bundle.main.path(forResource: "Flowers", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([LearningEntity].self, from: jsonData)
                    {
                        self.allFlowers = entityObject
                        self.allFlowers.shuffle()
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [LearningEntity]()
    }
    
    
    final func AllObjects()->[LearningEntity]
    {
        if(self.allObjects.count>0)
        {
            return self.allObjects
        }
        if let path = Bundle.main.path(forResource: "Objects", ofType: "json") {
            do {
                let jsonString = try String(contentsOfFile: path, encoding: .utf8)
                if let jsonData = jsonString.data(using: .utf8)
                {
                    if let entityObject = try? JSONDecoder().decode([LearningEntity].self, from: jsonData)
                    {
                        self.allObjects = entityObject
                        self.allObjects.shuffle()
                        return entityObject
                    }
                }
            } catch {
            }
        }
        return [LearningEntity]()
    }
    
    
    
    
    
    
    
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
}
