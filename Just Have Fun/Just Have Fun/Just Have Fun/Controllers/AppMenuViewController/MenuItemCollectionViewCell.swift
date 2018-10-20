//
//  MenuItemCollectionViewCell.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 08/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var top: NSLayoutConstraint!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    var currentMenuItem:AppMenuItems = .Colors
    var currentMenuEntity:AnyObject? = nil
    {
        didSet{
            if let imageEntity = self.currentMenuEntity as? LearningEntity
            {
                self.menuImage.isHidden = false
                if(self.currentMenuItem == .Settings)
                {
                    self.menuImage.image = self.currentMenuItem.titleImage()
                }
                else
                {
                    if(AppSettings.shared().shouldUseDynamicMenuIcons)
                    {
                        self.menuImage.image = imageEntity.Image()
                    }
                    else
                    {
                        self.menuImage.image = self.currentMenuItem.titleImage()
                    }
                }
            }
            else if let colorEntity = self.currentMenuEntity as? ColorPalette
            {
                self.menuImage.isHidden = false
                self.menuImage.image = self.currentMenuItem.titleImage()
            }
//           // self.menuImage.image = self.currentMenuItem.titleImage()
//            if (self.currentMenuItem == .Settings)
//            {
////                self.leading.constant = 30
////                self.top.constant = 30
////                self.bottom.constant = 30
////                self.trailing.constant = 30
//            }
//            else
//            {
////                self.leading.constant = 0
////                self.top.constant = 0
////                self.bottom.constant = 0
////                self.trailing.constant = 0
//            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.prepare()
        self.contentView.addShadow(with: UIColor.black)
    }
    
    func prepare()  {
        self.backgroundColor = UIColor.clear
        self.menuImage.backgroundColor = UIColor.white
        self.contentView.layer.cornerRadius = self.contentView.bounds.height/2
        self.menuImage.layer.cornerRadius = self.menuImage.bounds.height/2
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.borderWidth = 3
        self.contentView.clipsToBounds = true
        self.menuImage.clipsToBounds = true
    }

}
