//
//  SettingsViewCell.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 09/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import UIKit
protocol SettingsChangedProtocol {
    func onSettingsChanged(settings newSettings:AppSettings)
}

class SettingsViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    var delegate:SettingsChangedProtocol? = nil
    var currentSettings:AppSettings? = nil
    var currentSettingMode:SettingsType = .SoundFeedback
    {
        didSet
        {
            self.label.text = self.currentSettingMode.displayText()
            if(self.currentSettingMode == .SoundFeedback)
            {
                self.settingsSwitch.isHidden = false
                self.settingsSwitch.setOn(self.currentSettings?.shouldProvideSoundFeedback == true, animated: true)
            }
            else if(self.currentSettingMode == .HaptikFeedback)
            {
                self.settingsSwitch.isHidden = false
                self.settingsSwitch.setOn(self.currentSettings?.shouldProvideHaptikFeedback == true, animated: true)
            }
            else if(self.currentSettingMode == .SpeakTheObjects)
            {
                self.settingsSwitch.isHidden = false
                self.settingsSwitch.setOn(self.currentSettings?.shouldSpeakObjects == true, animated: true)
            }
            else if(self.currentSettingMode == .UseNextPreviousButtons)
            {
                self.settingsSwitch.isHidden = true
                if(self.currentSettings?.shouldUseTaps == false)
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
                if(self.currentSettings?.shouldUseTaps == true)
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
        if(self.currentSettings == nil)
        {
            self.currentSettings = AppSettings()
        }
        if(self.currentSettingMode == .SoundFeedback)
        {
            self.currentSettings?.shouldProvideSoundFeedback = self.settingsSwitch.isOn
        }
        else if(self.currentSettingMode == .HaptikFeedback)
        {
           self.currentSettings?.shouldProvideHaptikFeedback = self.settingsSwitch.isOn
        }
        else if(self.currentSettingMode == .SpeakTheObjects)
        {
           self.currentSettings?.shouldSpeakObjects = self.settingsSwitch.isOn
        }
        else if(self.currentSettingMode == .UseNextPreviousButtons || self.currentSettingMode == .UseTaps)
        {
            self.currentSettings?.shouldUseTaps = (self.accessoryType == .checkmark)
        }
        if let del = self.delegate
        {
            del.onSettingsChanged(settings: self.currentSettings!)
        }
    }
}
