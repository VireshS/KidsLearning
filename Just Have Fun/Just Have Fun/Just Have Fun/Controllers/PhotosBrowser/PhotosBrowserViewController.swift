//
//  PhotosBrowserViewController.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

class PhotosBrowserViewController: UIViewController {

    private var allPhotos = [UIImage]()
    @IBOutlet weak var imageView: UIImageView!
    
    private var currentDisplayingIndex = 0
    {
        didSet{
            if(self.currentDisplayingIndex >= self.allPhotos.count)
            {
                self.currentDisplayingIndex = self.allPhotos.count - 1
            }
        }
    }
    
    private func nextImage()->UIImage?
    {
        self.currentDisplayingIndex = self.currentDisplayingIndex + 1
        if(self.currentDisplayingIndex >= self.allPhotos.count - 1)
        {
            self.allPhotos.shuffle()
        }
        return self.allPhotos[self.currentDisplayingIndex]
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.imageView.image = self.nextImage()
    }
    
    

    class func photosBrowser(withPhotos photos:[UIImage])->PhotosBrowserViewController?
    {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "PhotosBrowserViewController") as? PhotosBrowserViewController
        {
            controller.allPhotos = photos
            return controller
        }
        return nil
    }

}
