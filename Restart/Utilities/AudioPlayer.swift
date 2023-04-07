//  AudioPlayer.swift
//  Restart
//
//  Created by Mahesh Yakami on 07/04/2023.
//  
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Couldnot play the sound file")
        }
    }
}
