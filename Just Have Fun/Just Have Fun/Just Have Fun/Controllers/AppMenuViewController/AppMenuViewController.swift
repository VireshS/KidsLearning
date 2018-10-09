//
//  AppMenuViewController.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 08/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit
protocol MenuChangedProtocol {
    func didChanged(menu tomode:AppMenuItems)
}

class AppMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var isMenuOpen = false
    var delegate :MenuChangedProtocol? = nil
    private var appMenuItems:[AppMenuItems] = [AppMenuItems]()
    private var tempAppMenuItems:[AppMenuItems] = [AppMenuItems]()
    //private var currentMenuMode :AppMenuItems = .Colors
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.appMenuItems.append(self.tempAppMenuItems[0])
        self.collectionView.register(UINib(nibName: "MenuItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuItemCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.mainImage.backgroundColor = UIColor.cyan
        self.mainImage.layer.cornerRadius = self.mainImage.bounds.height/2
        self.mainImage.layer.borderColor = UIColor.white.cgColor
        self.mainImage.layer.borderWidth = 3
        self.mainImage.clipsToBounds = true
        self.mainImage.isHidden = true
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.scrollDirection = .horizontal
        }

//        self.isMenuOpen = true
//        self.appMenuItems.append(self.tempAppMenuItems[1])
//        self.collectionView.insertSections([1])
//        self.appMenuItems.append(self.tempAppMenuItems[2])
//        self.collectionView.insertSections([2])
//        self.appMenuItems.append(self.tempAppMenuItems[3])
//        self.collectionView.insertSections([3])
//        self.appMenuItems.append(self.tempAppMenuItems[4])
//        self.collectionView.insertSections([4])
//        self.appMenuItems.append(self.tempAppMenuItems[5])
//        self.collectionView.insertSections([5])
        if let weakDeleagte = self.delegate
        {
            weakDeleagte.didChanged(menu: self.appMenuItems.first!)
        }
    }
    
    private func openMenu()
    {
        //self.collectionView.isHidden = false
       // self.mainImage.isHidden = true
    }
    private func collapseMenu()
    {
        self.isMenuOpen = !self.isMenuOpen
        self.collectionView.reloadData()
        return
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.mainImage), with: event)
            
            if hitView === self.mainImage {
               // self.openMenu()
                return
            }
        }
    }
    
    class func menuController(with menuItems:[AppMenuItems], andDelegate:MenuChangedProtocol)->AppMenuViewController?
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let controller = sb.instantiateViewController(withIdentifier: "AppMenuViewController") as? AppMenuViewController
        {
            controller.delegate = andDelegate
            controller.appMenuItems = menuItems
            //controller.currentMenuMode = menuItems.first!
            return controller
        }
        return nil
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       if let menuMode = (collectionView.cellForItem(at: indexPath) as? MenuItemCollectionViewCell)?.currentMenuItem
       {
             if let weakDeleagte = self.delegate
             {
                 if(self.isMenuOpen)
                {
                    if(menuMode != .Settings)
                    {
                        self.appMenuItems.remove(at: self.appMenuItems.index(of: menuMode)!)
                        self.appMenuItems.insert(menuMode, at: 0)
                        self.mainImage.image = menuMode.titleImage()
                    }
                    weakDeleagte.didChanged(menu: menuMode)
                }
             }
         self.collapseMenu()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.isMenuOpen ? self.appMenuItems.count :1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCollectionViewCell", for: indexPath) as? MenuItemCollectionViewCell
        {
            cell.currentMenuItem = self.appMenuItems[indexPath.section]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}
