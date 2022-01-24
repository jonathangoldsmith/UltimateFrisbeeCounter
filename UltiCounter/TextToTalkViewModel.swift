//
//  TextToTalkViewModel.swift
//  UltiCounter
//
//  Created by Jonathan Goldsmith on 1/23/22.
//

import AVFoundation
import Combine

class TextToTalkViewModel: NSObject, ObservableObject {
  private var speechSynthesizer = AVSpeechSynthesizer()
  
  override init() {
    super.init()
    speechSynthesizer.delegate = self
    let utterance = AVSpeechUtterance(string: "Good luck, have fun!")
    speechSynthesizer.speak(utterance)
  }
  
  func speak(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    speechSynthesizer.speak(utterance)
  }
}

extension TextToTalkViewModel: AVSpeechSynthesizerDelegate {
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {}
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {}
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {}
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {}
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {}
  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {}
}
