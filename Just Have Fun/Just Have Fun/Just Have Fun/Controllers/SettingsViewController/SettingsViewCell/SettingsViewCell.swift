//
//  SettingsViewCell.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 09/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit
protocol SettingsChangedProtocol {
    func onSettingsChanged()
}

class SettingsViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    var delegate:SettingsChangedProtocol? = nil
    var currentSettingMode:SettingsType = .SoundFeedback
    {
        didSet
        {
            self.label.text = self.currentSettingMode.displayText()
            if(self.currentSettingMode == .DynamicMenuIcon)
            {
                self.settingsSwitch.isHidden = false
                self.settingsSwitch.setOn(AppSettings.shared().shouldUseDynamicMenuIcons == true, animated: true)
            }
            else if(self.currentSettingMode == .SoundFeedback)
            {
                self.settingsSwitch.isHidden = false
                self.settingsSwitch.setOn(AppSettings.shared().shouldProvideSoundFeedback == true, animated: true)
            }
            else if(self.currentSettingMode == .HaptikFeedback)
            {
                self.settingsSwitch.isHidden = false
                self.settingsSwitch.setOn(AppSettings.shared().shouldProvideHaptikFeedback == true, animated: true)
            }
            else if(self.currentSettingMode == .SpeakTheObjects)
            {
                self.settingsSwitch.isHidden = false
                self.settingsSwitch.setOn(AppSettings.shared().shouldSpeakObjects == true, animated: true)
            }
            else if(self.currentSettingMode == .UseNextPreviousButtons)
            {
                self.settingsSwitch.isHidden = true
                if(AppSettings.shared().shouldUseTaps == false)
                {
                    self.accessoryType = .checkmark
                }
                else
                {
                    self.accessoryType = .none
                }
            }
            else if(self.currentSettingMode == .UseTaps)
            {
                self.settingsSwitch.isHidden = true
                if(AppSettings.shared().shouldUseTaps == true)
                {
                    self.accessoryType = .checkmark
                }
                else
                {
                    self.accessoryType = .none
                }
            }
            else
            {
                self.settingsSwitch.isHidden = true
                self.accessoryType = .none
            }
        }
    }
    
    
    @IBAction func onSettingsChanged(_ sender: Any) {
        
        if(self.currentSettingMode == .DynamicMenuIcon)
        {
            AppSettings.shared().shouldUseDynamicMenuIcons = self.settingsSwitch.isOn
        }
        else if(self.currentSettingMode == .SoundFeedback)
        {
            AppSettings.shared().shouldProvideSoundFeedback = self.settingsSwitch.isOn
        }
        else if(self.currentSettingMode == .HaptikFeedback)
        {
           AppSettings.shared().shouldProvideHaptikFeedback = self.settingsSwitch.isOn
        }
        else if(self.currentSettingMode == .SpeakTheObjects)
        {
           AppSettings.shared().shouldSpeakObjects = self.settingsSwitch.isOn
        }
        else if(self.currentSettingMode == .UseNextPreviousButtons || self.currentSettingMode == .UseTaps)
        {
            AppSettings.shared().shouldUseTaps = (self.accessoryType == .checkmark)
        }
        if let del = self.delegate
        {
            del.onSettingsChanged()
        }
    }
}
