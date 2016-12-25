//
//  SEManager.swift
//  HistoriCalc
//
//  Created by kaori baba on 2016/12/25.
//  Copyright © 2016年 kaori baba. All rights reserved.
//

import Foundation
import AVFoundation

class SEManager: NSObject, AVAudioPlayerDelegate {
    
    var soundArray = [AVAudioPlayer]()
    var player: AVAudioPlayer!
    
    func sePlay(soundName: String) {
        let path = Bundle.main.bundleURL.appendingPathComponent(soundName);
        do {
            try player = AVAudioPlayer(contentsOf: path)
            soundArray.append(player)
            player.delegate = self
            player.prepareToPlay()
            player.play()
        }
        catch {
            print("sound_error")
        }
    }
    
    func seStop() {
        if ( player.isPlaying ){
            player.stop()
        }
        else{
            player.play()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let i: Int = soundArray.index(of: player)!
        soundArray.remove(at: i)
    }
}
