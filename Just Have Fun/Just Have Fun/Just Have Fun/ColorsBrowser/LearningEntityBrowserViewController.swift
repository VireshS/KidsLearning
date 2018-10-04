//
//  PhotosBrowserViewController.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

class LearningEntityBrowserViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    private var allEntities = [AnyObject]()
    
    func refresh(with Entities:[AnyObject]){
        self.allEntities.removeAll()
        self.allEntities.append(contentsOf: Entities)
        self.showFirst()
    }
    
    private var currentDisplayingIndex = 0
    {
        didSet{
            if(self.currentDisplayingIndex >= self.allEntities.count)
            {
                self.currentDisplayingIndex = self.allEntities.count - 1
            }
        }
    }
    
    func nextEntity()
    {
        if(self.currentDisplayingIndex >= self.allEntities.count - 1)
        {
            self.currentDisplayingIndex = 0
        }
        else if(self.currentDisplayingIndex <= 0)
        {
            self.currentDisplayingIndex = self.allEntities.count
        }
        self.currentDisplayingIndex = self.currentDisplayingIndex + 1
        
        let entity = self.allEntities[self.currentDisplayingIndex]
        self.show(newEntity: entity)
    }
    
    func previousEntity()
    {
        if(self.currentDisplayingIndex >= self.allEntities.count - 1)
        {
            self.currentDisplayingIndex = 0
        }
        else if(self.currentDisplayingIndex <= 0)
        {
            self.currentDisplayingIndex = self.allEntities.count
        }
        self.currentDisplayingIndex = self.currentDisplayingIndex - 1
        
        let entity = self.allEntities[self.currentDisplayingIndex]
        self.show(newEntity: entity)
    }
    
    
    private func show(newEntity entity:AnyObject)
    {
        if let imageEntity = entity as? LearningEntity
        {
            self.imageView.isHidden = false
            self.imageView.image = imageEntity.Image()
        }
        else if let colorEntity = entity as? ColorPalette
        {
            self.imageView.isHidden = true
            let color = colorEntity.actualColor()
            self.view.backgroundColor = color
        }
    }
    
    private func showFirst()
    {
        if let first = self.allEntities.first
        {
            self.show(newEntity: first)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        //self.showEntity()
    }
    
    

    class func create()->LearningEntityBrowserViewController?
    {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "LearningEntityBrowserViewController") as? LearningEntityBrowserViewController
        {
            return controller
        }
        return nil
    }

}
