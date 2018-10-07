//
//  SpeechEngine.swift
//  Just Have Fun
//
//  Created by Singh, Viresh on 03/10/18.
//  Copyright © 2018 Honeywell. All rights reserved.
//

import Foundation
import AVFoundation

class SpeakingSettings
{
    var rate = 0.75
    var volume = 0.75
    var pitchMultiplier = 0.25
}
class SpeechEngine
{
    static let defaultInstance = SpeechEngine()
    private var speakingSettings = SpeakingSettings()
    private let speechSynthesizer = AVSpeechSynthesizer()
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
        let speechUtterance = AVSpeechUtterance(string: messageToSpeak)
        speechUtterance.rate = 0.25
        speechUtterance.pitchMultiplier = 0.25
        speechUtterance.volume = 0.75
        let voice = AVSpeechSynthesisVoice(language: "hi-IN")
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
