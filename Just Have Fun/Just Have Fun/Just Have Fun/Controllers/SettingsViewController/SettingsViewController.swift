//
//  SettingsViewController.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 04/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit

enum SettingsType {
    case SoundFeedback
    case HaptikFeedback
    case SpeakTheObjects
    case UseNextPreviousButtons
    case UseTaps
    
    func displayText()->String
    {
        if(self == .SoundFeedback)
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
        else if(self == .UseNextPreviousButtons)
        {
            return "Use Next and Previous Buttons"
        }
        else if(self == .UseTaps)
        {
            return "Use Tap"
        }
        return ""
    }
}

class SettingsViewController: UIViewController
{
    var currentSettings = AppSettings()
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
    func onSettingsChanged(settings newSettings: AppSettings) {
        SpeechEngine.defaultEngine().register(settings: newSettings)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsViewCell", for: indexPath) as? SettingsViewCell
        {
            cell.currentSettings = self.currentSettings
            if(indexPath.section == 0)
            {
                if(indexPath.row == 0)
                {
                    cell.currentSettingMode = .SoundFeedback
                }
                else if(indexPath.row == 1)
                {
                    cell.currentSettingMode = .HaptikFeedback
                }
                else if(indexPath.row == 2)
                {
                    cell.currentSettingMode = .SpeakTheObjects
                }
            }
            else if(indexPath.section == 1)
            {
                if(indexPath.row == 0)
                {
                    cell.currentSettingMode = .UseNextPreviousButtons
                }
                else if(indexPath.row == 1)
                {
                    cell.currentSettingMode = .UseTaps
                }
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1)
        {
            if(indexPath.row == 0)
            {
                self.currentSettings.shouldUseTaps = false
            }
            else if(indexPath.row == 1)
            {
                self.currentSettings.shouldUseTaps = true
            }
            tableView.reloadData()
        }
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
