//
//  File.swift
//  Pods
//
//  Created by Amr Omran on 12/24/2018.
//

import Foundation
import AVFoundation

public protocol SKTextToSpeech {
    func read(text: String)
}

public extension SKTextToSpeech {
    
    func read(text: String) {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: Locale.current.languageCode)
        synthesizer.speak(utterance)
    }
    
}

