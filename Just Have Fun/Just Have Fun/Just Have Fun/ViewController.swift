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
    
    @IBOutlet weak var subheaderView: UIView!
    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerView: UIView!
     @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private let appMenuItems = AppMenuItems.allMenus()
    private var learningEntityBrowser:LearningEntityBrowserViewController? = nil
    private var swipeUpGesture:UISwipeGestureRecognizer? = nil
    private var swipeDownGesture:UISwipeGestureRecognizer? = nil
    private var currentMenuMode = AppMenuItems.allMenus().first
    {
        didSet{
            self.collectionView.reloadData()
        }
    }
    private var isHeaderLocked = true
    {
        didSet{
            self.swipeUpGesture?.isEnabled = !self.isHeaderLocked
            self.swipeDownGesture?.isEnabled = !self.isHeaderLocked
            let image  = self.isHeaderLocked ? UIImage(named: "lock.png") : UIImage(named: "unlock.png")
            let bgColor = self.isHeaderLocked ? UIColor.ISPRed() : UIColor.ISPGreen()
            self.lockButton.setImage(image, for: .normal)
            self.lockButton.setImage(image, for: .disabled)
            self.lockButton.setImage(image, for: .highlighted)
            self.lockButton.setImage(image, for: .selected)
            self.subheaderView.backgroundColor = bgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "AppMenuCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "AppMenuCollectionViewCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeDetected(sender:)))
        self.swipeUpGesture?.numberOfTouchesRequired = 1
        self.swipeUpGesture?.direction = [UISwipeGestureRecognizerDirection.up]
        self.view.addGestureRecognizer(self.swipeUpGesture!)
        
        self.swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(onSwipeDetected(sender:)))
        self.swipeDownGesture?.numberOfTouchesRequired = 1
        self.swipeDownGesture?.direction = [UISwipeGestureRecognizerDirection.down]
        self.view.addGestureRecognizer(self.swipeDownGesture!)
        
        self.isHeaderLocked = true
        self.styleButtons()
    }
    
    func styleButtons()  {
        self.nextView.layer.cornerRadius = self.nextView.bounds.size.height/2
        self.nextView.layer.borderColor = UIColor.white.cgColor
        self.nextView.layer.borderWidth = 2.0
        self.nextView.addShadow(with: UIColor.black)
        self.previousView.layer.cornerRadius = self.previousView.bounds.size.height/2
        self.previousView.layer.borderColor = UIColor.white.cgColor
        self.previousView.layer.borderWidth = 2.0
        self.previousView.addShadow(with: UIColor.black)
        self.previousView.addShadow(with: UIColor.black)
    }

    @objc func onSwipeDetected(sender:UISwipeGestureRecognizer)
    {
        if(sender.state == UIGestureRecognizerState.ended)
        {
            print("ended")
            switch(sender.direction)
            {
                case UISwipeGestureRecognizerDirection.up:
                    print("up")
                    UIView.animate(withDuration: 0.2) {
                        self.headerViewHeightConstraint.constant = 0
                        self.view.layoutIfNeeded()
                    }
                break
                case UISwipeGestureRecognizerDirection.down:
                    print("down")
                    UIView.animate(withDuration: 0.2) {
                        self.headerViewHeightConstraint.constant = 220
                        self.view.layoutIfNeeded()
                    }
                    break
                case UISwipeGestureRecognizerDirection.left:
                    print("left")
                    break
                case UISwipeGestureRecognizerDirection.right:
                    print("right")
                    break
            default:
                print("default")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.subheaderView), with: event)
            
            if hitView === self.subheaderView {
                self.onLockToggle(self.lockButton)
                return
            } 
        }
    }
    @IBAction func onSettings(_ sender: Any) {
        var popoverContent = self.storyboard?.instantiateViewController(withIdentifier:"SettingsViewController")
        
        popoverContent!.modalPresentationStyle = UIModalPresentationStyle.formSheet
        var popover = popoverContent!.popoverPresentationController
        popoverContent!.preferredContentSize = CGSize(width: self.view.bounds.size.width-200, height: self.view.bounds.size.height-200)
       
        
        self.present(popoverContent!, animated: true) {
            
        }
    }
    
    @IBAction func onLockToggle(_ sender: Any) {
        self.isHeaderLocked = !self.isHeaderLocked
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let mode = (collectionView.cellForItem(at: indexPath) as? AppMenuCollectionViewCell)?.currentMenuMode
        {
            if(self.learningEntityBrowser == nil)
            {
                self.learningEntityBrowser = LearningEntityBrowserViewController.create()!
            }
            self.learningEntityBrowser?.view.frame = self.containerView.bounds
            self.containerView.addSubview(self.learningEntityBrowser!.view)
            let textToSpeak = mode.descriptionText()
            if(mode == .Fruits)
            {
                self.learningEntityBrowser?.refresh(with: DataLoader.AllFruits())
            }
            else if(mode == .Vegetables)
            {
               self.learningEntityBrowser?.refresh(with: DataLoader.AllVegetables())
            }
            else if(mode == .Colors)
            {
                self.learningEntityBrowser?.refresh(with: DataLoader.AllColors())
            }
            SpeechEngine.defaultEngine().speak(message: textToSpeak)
            self.currentMenuMode = mode
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.appMenuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppMenuCollectionViewCell", for: indexPath) as? AppMenuCollectionViewCell
        {
            cell.currentMenuMode = self.appMenuItems[indexPath.section]
            cell.updateCell()
            if(cell.currentMenuMode == self.currentMenuMode)
            {
                //cell.backgroundColor = UIColor.white
                cell.makeActive()
            }
            else
            {
               // cell.backgroundColor = UIColor.clear
                cell.makeInactive()
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: collectionView.frame.size.height)
    }
    
   
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ViewController
{
    @IBAction func onNext(_ sender: Any) {
        if let learningBrowser = self.learningEntityBrowser
        {
            learningBrowser.nextEntity()
        }
    }
    
    
    @IBAction func onPrevious(_ sender: Any) {
        if let learningBrowser = self.learningEntityBrowser
        {
            learningBrowser.previousEntity()
        }
    }
}

