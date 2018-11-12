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
    func onSpeakAgain()
}

class AppMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var speakAgainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var isMenuOpen = false
    var delegate :MenuChangedProtocol? = nil
    private var appMenu = AppMenu.sharedMenu()
    //private var appMenuItemEntities:[String:AnyObject?] = [String:AnyObject?]()
    //private var tempAppMenuItems:[AppMenuItems] = [AppMenuItems]()
    //private var currentMenuMode :AppMenuItems = .Colors
   
//    func updateLearningEntity(for mode:AppMenuItems, withEntity:AnyObject)
//    {
//        self.appMenuItemEntities[mode.descriptionText()] = withEntity
//        var cellsToReload = [IndexPath]()
//        for cell in self.collectionView.visibleCells {
//            if let uwpCell = cell as? MenuItemCollectionViewCell
//            {
//                if(uwpCell.currentMenuItem == mode)
//                {
//                    cellsToReload.append(self.collectionView.indexPath(for: uwpCell)!)
//                }
//            }
//        }
//        self.collectionView.reloadItems(at: cellsToReload)
//    }
    
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
        self.speakAgainView.clipsToBounds = true
        self.speakAgainView.layer.cornerRadius = self.speakAgainView.frame.size.width/2
        self.speakAgainView.addShadow(with: UIColor.black)
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
            weakDeleagte.didChanged(menu: self.appMenu.allMenuModeEnumValues().first!)
        }
    }
    
    
    
    final func openMenu(shouldOnlyReload onlyReload:Bool = false)
    {
        if(onlyReload)
        {
            self.collectionView.reloadData()
            return
        }
        if(self.isMenuOpen != true)
        {
            self.isMenuOpen = true
        }
        UIView.animate(withDuration: 0.2) {
            self.speakAgainView.alpha = 0
            self.speakAgainView.frame = CGRect(x: self.view.frame.size.width, y: (self.view.frame.size.height-100)/2, width: 100, height: 100)
        }
        self.collectionView.reloadData()
    }
    
    final func collapseMenu(shouldOnlyReload onlyReload:Bool = false)
    {
        if(onlyReload)
        {
            self.collectionView.reloadData()
            return
        }
        if(self.isMenuOpen != false)
        {
            self.isMenuOpen = false
        }
        UIView.animate(withDuration: 0.2) {
            self.speakAgainView.alpha = 1
            self.speakAgainView.frame = CGRect(x: self.view.frame.size.width-100-20, y: (self.view.frame.size.height-100)/2, width: 100, height: 100)
        }
        self.collectionView.reloadData()
    }
    
    private func toggleMenu()
    {
        self.isMenuOpen ? self.collapseMenu() : self.openMenu()
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
    
    class func menuController(with delegate:MenuChangedProtocol)->AppMenuViewController?
    {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let controller = sb.instantiateViewController(withIdentifier: "AppMenuViewController") as? AppMenuViewController
        {
            controller.delegate = delegate
            controller.appMenu = AppMenu.sharedMenu()
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
//                        self.appMenuItems.remove(at: self.appMenuItems.index(of: menuMode)!)
//                        self.appMenuItems.insert(menuMode, at: 0)
                        self.mainImage.image = menuMode.titleImage()
                        AppMenu.sharedMenu().updateCurrentMenuMode(toMode: menuMode)
                    }
                    weakDeleagte.didChanged(menu: menuMode)
                }
             }
         self.toggleMenu()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.isMenuOpen ? self.appMenu.allMenus().count :1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuItemCollectionViewCell", for: indexPath) as? MenuItemCollectionViewCell
        {
            let allMenus = self.appMenu.allMenus()
            cell.currentMenuItem = allMenus[indexPath.section].menuMode
            cell.currentMenuEntity = allMenus[indexPath.section].menuEntity
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
    
    
    @IBAction func onSpeak(_ sender: Any) {
        if let weakDeleagte = self.delegate
        {
            weakDeleagte.onSpeakAgain()
        }
    }
    
}
