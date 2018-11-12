//
//  SpeechEngine.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import Foundation
import AVFoundation


class AppSettings:NSObject
{
    var shouldUseDynamicMenuIcons = true
    {
        didSet{
            UserDefaults.standard.set(shouldUseDynamicMenuIcons, forKey: "shouldUseDynamicMenuIcons")
            UserDefaults.standard.synchronize()
        }
    }
    var shouldProvideSoundFeedback = false
    {
        didSet{
            UserDefaults.standard.set(shouldProvideSoundFeedback, forKey: "shouldProvideSoundFeedback")
            UserDefaults.standard.synchronize()
        }
    }
    var shouldProvideHaptikFeedback = false
    {
        didSet{
            UserDefaults.standard.set(shouldProvideHaptikFeedback, forKey: "shouldProvideHaptikFeedback")
            UserDefaults.standard.synchronize()
        }
    }
    var shouldSpeakObjects = false
    {
        didSet{
            UserDefaults.standard.set(shouldSpeakObjects, forKey: "shouldSpeakObjects")
            UserDefaults.standard.synchronize()
        }
    }
    
    var shouldSlideShow = true
    {
        didSet{
            UserDefaults.standard.set(shouldSlideShow, forKey: "shouldSlideShow")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    let speakingSettings = SpeakingSettings()
    private static var settings:AppSettings? = nil
    class func shared() -> AppSettings
    {
        if(settings == nil)
        {
            settings = AppSettings()
            settings!.updateDefaultSettings()
        }
        return settings!
    }
    
    func clone() -> AppSettings {
        let newSettings = AppSettings()
        newSettings.shouldUseDynamicMenuIcons = self.shouldUseDynamicMenuIcons
        newSettings.shouldProvideSoundFeedback = self.shouldProvideSoundFeedback
        newSettings.shouldProvideHaptikFeedback = self.shouldProvideHaptikFeedback
        newSettings.shouldSpeakObjects = self.shouldSpeakObjects
        newSettings.shouldSlideShow = self.shouldSlideShow
        newSettings.speakingSettings.rate = self.speakingSettings.rate
        newSettings.speakingSettings.volume = self.speakingSettings.volume
        newSettings.speakingSettings.pitchMultiplier = self.speakingSettings.pitchMultiplier
        return newSettings
    }
    
    private func updateDefaultSettings()
    {
        self.shouldUseDynamicMenuIcons = UserDefaults.standard.bool(forKey: "shouldUseDynamicMenuIcons")
        self.shouldProvideSoundFeedback = UserDefaults.standard.bool(forKey: "shouldProvideSoundFeedback")
        self.shouldProvideHaptikFeedback = UserDefaults.standard.bool(forKey: "shouldProvideHaptikFeedback")
        self.shouldSpeakObjects = UserDefaults.standard.bool(forKey: "shouldSpeakObjects")
        self.shouldSlideShow = UserDefaults.standard.bool(forKey: "shouldSlideShow")
        self.speakingSettings.rate = 0.3
        self.speakingSettings.volume = 0.75
        self.speakingSettings.pitchMultiplier = 0.75
    }
    
}


class SpeakingSettings
{
    var rate = 0.75
    var volume = 0.75
    var pitchMultiplier = 0.25
}
class SpeechEngine
{
    private var settings:AppSettings = AppSettings()
    static let defaultInstance = SpeechEngine()
    private var speakingSettings = SpeakingSettings()
    private let speechSynthesizer = AVSpeechSynthesizer()
    
    func register(settings newSettings:AppSettings)  {
        self.settings = newSettings
    }
    class func defaultEngine(withSettings settings:SpeakingSettings? = nil) -> SpeechEngine {
        if(settings != nil)
        {
            SpeechEngine.defaultInstance.speakingSettings = settings!
        }
        //var a = AVSpeechSynthesisVoice.speechVoices()
        //print(AVSpeechSynthesisVoice.speechVoices())
        return SpeechEngine.defaultInstance
    }
    func speak(message messageToSpeak:String)
    {
        if(AppSettings.shared().shouldProvideSoundFeedback == false)
        {
            return
        }
        let speechUtterance = AVSpeechUtterance(string: messageToSpeak)
        speechUtterance.rate = Float(AppSettings.shared().speakingSettings.rate)
        speechUtterance.pitchMultiplier = Float(AppSettings.shared().speakingSettings.pitchMultiplier)
        speechUtterance.volume = Float(AppSettings.shared().speakingSettings.volume)
        let voice = AVSpeechSynthesisVoice(language: "en-US")
        speechUtterance.voice = voice
        self.stopSpeaking()
        self.speechSynthesizer.speak(speechUtterance)
    }
    
    func pauseSpeaking() {
        self.speechSynthesizer.pauseSpeaking(at:AVSpeechBoundary.word)
    }
    
    
    func stopSpeaking() {
        self.speechSynthesizer.stopSpeaking(at:AVSpeechBoundary.immediate)
    }
}
