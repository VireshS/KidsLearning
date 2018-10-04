//
//  AppMenuCollectionViewCell.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

class AppMenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var blurView: UIView!
    
    @IBOutlet weak var menuLabel: UILabel!
    var currentMenuMode:AppMenuItems = .Colors
   
    func updateCell()
    {
        self.menuLabel?.text = self.currentMenuMode.descriptionText()
        self.imageView?.image = self.currentMenuMode.titleImage()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func makeActive()  {
        self.blurView.isHidden = true
    }
    
    func makeInactive()  {
        self.blurView.isHidden = false
    }
}
