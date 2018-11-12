//
//  SettingsViewController.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 04/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

enum SettingsType {
    case DynamicMenuIcon
    case SoundFeedback
    case HaptikFeedback
    case SpeakTheObjects
    case UseSlideShow
    
    func displayText()->String
    {
        if(self == .DynamicMenuIcon)
        {
            return "Use Dynamic Menu Icons"
        }
        else if(self == .SoundFeedback)
        {
            return "Sound Feedback on Tap"
        }
        else if(self == .HaptikFeedback)
        {
            return "Haptik Feedback on Tap"
        }
        else if(self == .SpeakTheObjects)
        {
            return "Speak the Objects"
        }
        else if(self == .UseSlideShow)
        {
            return "Auto Slide Show"
        }
        return ""
    }
}

class SettingsViewController: UIViewController
{
    var delegate:SettingsChangedProtocol? = nil
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "SettingsViewCell", bundle: nil), forCellReuseIdentifier: "SettingsViewCell")
        self.tableView.register(UINib(nibName: "CustomHeaderFooterView", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "CustomHeaderFooterView")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func onDone(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


extension SettingsViewController:UITableViewDelegate, UITableViewDataSource,SettingsChangedProtocol
{
    func onSettingsChanged() {
        if let del = self.delegate
        {
            del.onSettingsChanged()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsViewCell", for: indexPath) as? SettingsViewCell
        {
            cell.delegate = self
            if(indexPath.section == 0)
            {
                if(indexPath.row == 0)
                {
                    cell.currentSettingMode = .DynamicMenuIcon
                }
                else if(indexPath.row == 1)
                {
                    cell.currentSettingMode = .SoundFeedback
                }
                else if(indexPath.row == 2)
                {
                    cell.currentSettingMode = .HaptikFeedback
                }
                else if(indexPath.row == 3)
                {
                    cell.currentSettingMode = .SpeakTheObjects
                }
            }
            else if(indexPath.section == 1)
            {
                if(indexPath.row == 0)
                {
                   cell.currentSettingMode = .UseSlideShow
                }
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? SettingsViewCell
        {
            let mode = cell.currentSettingMode
            
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: CustomHeaderFooterView?  = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderFooterView") as? CustomHeaderFooterView
        header?.headerTitleLabel.text = section == 0 ? "FEEDBACK" : "INTERACTIONS"
        return header
    }
    
}
