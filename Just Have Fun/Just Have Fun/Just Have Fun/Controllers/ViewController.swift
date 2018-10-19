//
//  ViewController.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var nextView: UIView!
     @IBOutlet weak var previousView: UIView!
    
  
     @IBOutlet weak var containerView: UIView!

    private let appMenuItems = AppMenuItems.allMenus()
    private var menuController:AppMenuViewController? = nil
    
    private var learningEntityBrowsers:[LearningEntityBrowserViewController] = [LearningEntityBrowserViewController]()
    private var swipeUpGesture:UISwipeGestureRecognizer? = nil
    private var swipeDownGesture:UISwipeGestureRecognizer? = nil
    fileprivate var currentMenuMode = AppMenuItems.allMenus().first
    
    
    func loadMenu()
    {
        self.menuController = AppMenuViewController.menuController(with: self)
        self.menuController?.view.backgroundColor = UIColor.clear
        self.menuController?.view.frame = CGRect(x: 0, y: self.view.frame.size.height-150, width: self.view.frame.size.width, height: 150)
        self.view.addSubview(self.menuController!.view)
        self.menuController?.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.menuController?.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.menuController?.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.menuController?.view.heightAnchor.constraint(equalToConstant: self.menuController!.view.bounds.size.height).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataLoader.generateJsons()
        self.styleButtons()
        self.loadMenu()
        self.addBrowser(for: self.currentMenuMode!)
    }
    
    private func browser(for mode:AppMenuItems)->LearningEntityBrowserViewController?
    {
        for browser in self.learningEntityBrowsers {
            if(browser.currentMode == mode)
            {
                return browser
            }
        }
        return nil
    }
    
    private func currentBrowser()->LearningEntityBrowserViewController?
    {
        for browser in self.learningEntityBrowsers {
            if(browser.currentMode == self.currentMenuMode)
            {
                return browser
            }
            
        }
        return nil
    }
    
    private func addBrowser(for mode:AppMenuItems)
    {
        var target:LearningEntityBrowserViewController? = nil
        for browser in self.learningEntityBrowsers {
            if(browser.currentMode == mode)
            {
                target = browser
                self.containerView.addSubview(browser.view)
            }
            else
            {
                browser.view.removeFromSuperview()
            }
        }
        if(target == nil)
        {
            if let newBrowser = LearningEntityBrowserViewController.create()
            {
                newBrowser.view.frame = self.containerView.bounds
                self.containerView.addSubview(newBrowser.view)
                newBrowser.refresh(with: self.learningEntities(for: mode))
                self.learningEntityBrowsers.append(newBrowser)
            }
        }
    }
    
    private func learningEntities(for mode:AppMenuItems)->[AnyObject]
    {
        if(mode == .Animals)
        {
            return DataLoader.defaultLoader().AllAnimals()
        }
        if(mode == .Flowers)
        {
            return DataLoader.defaultLoader().AllFlowers()
        }
        if(mode == .Fruits)
        {
            return DataLoader.defaultLoader().AllFruits()
        }
        if(mode == .Objects)
        {
           return DataLoader.defaultLoader().AllObjects()
        }
        if(mode == .Vegetables)
        {
            return DataLoader.defaultLoader().AllVegetables()
        }
        if(mode == .Colors)
        {
            return DataLoader.defaultLoader().AllColors()
        }
        return [AnyObject]()
    }
    
   
    func styleButtons()  {
        self.nextView.layer.cornerRadius = self.nextView.bounds.size.height/2
        self.nextView.layer.borderColor = UIColor.orange.cgColor
        self.nextView.layer.borderWidth = 5.0
        self.nextView.addShadow(with: UIColor.black)
        self.previousView.layer.cornerRadius = self.previousView.bounds.size.height/2
        self.previousView.layer.borderColor = UIColor.orange.cgColor
        self.previousView.layer.borderWidth = 5.0
        self.previousView.addShadow(with: UIColor.black)
        self.previousView.addShadow(with: UIColor.black)
    }
}

//extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
//{
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let mode = (collectionView.cellForItem(at: indexPath) as? AppMenuCollectionViewCell)?.currentMenuMode
//        {
//            let textToSpeak = mode.descriptionText()
//            self.addBrowser(for: mode)
//            SpeechEngine.defaultEngine().speak(message: textToSpeak)
//            self.currentMenuMode = mode
//        }
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return self.appMenuItems.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppMenuCollectionViewCell", for: indexPath) as? AppMenuCollectionViewCell
//        {
//            cell.currentMenuMode = self.appMenuItems[indexPath.section]
//            cell.updateCell()
//            if(cell.currentMenuMode == self.currentMenuMode)
//            {
//                //cell.backgroundColor = UIColor.white
//                cell.makeActive()
//            }
//            else
//            {
//               // cell.backgroundColor = UIColor.clear
//                cell.makeInactive()
//            }
//            return cell
//        }
//        return UICollectionViewCell()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 250, height: collectionView.frame.size.height)
//    }
//    
//   
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
extension ViewController:MenuChangedProtocol
{
    func didChanged(menu tomode: AppMenuItems) {
        if(tomode == .Settings)
        {
            let popoverContent = self.storyboard?.instantiateViewController(withIdentifier:"SettingsViewController")
            popoverContent!.modalPresentationStyle = UIModalPresentationStyle.formSheet
            let popover = popoverContent!.popoverPresentationController
            popoverContent!.preferredContentSize = CGSize(width: self.view.bounds.size.width-200, height: self.view.bounds.size.height-200)
            
            
            self.present(popoverContent!, animated: true) {
                
            }
            return
        }
        self.addBrowser(for: tomode)
        if let currentBrowser = self.browser(for: tomode)
        {
            AppMenu.sharedMenu().updateEntity(for: tomode, entity:currentBrowser.currentEntity!)
        }
        SpeechEngine.defaultEngine().speak(message: tomode.descriptionText())
        self.currentMenuMode = tomode
    }
}
extension ViewController
{
    @IBAction func onNext(_ sender: Any) {
        if let learningBrowser = self.browser(for: self.currentMenuMode!)
        {
            let currentEntity = learningBrowser.nextEntity()
            AppMenu.sharedMenu().updateEntity(for: self.currentMenuMode!, entity: currentEntity)
            //self.menuController?.updateLearningEntity(for: self.currentMenuMode!, withEntity: currentEntity)
        }
        self.menuController?.collapseMenu()
    }
    
    
    @IBAction func onPrevious(_ sender: Any) {
        if let learningBrowser = self.browser(for: self.currentMenuMode!)
        {
            let currentEntity = learningBrowser.previousEntity()
            //self.menuController?.updateLearningEntity(for: self.currentMenuMode!, withEntity: currentEntity)
            AppMenu.sharedMenu().updateEntity(for: self.currentMenuMode!, entity: currentEntity)
        }
        self.menuController?.collapseMenu()
    }
}

