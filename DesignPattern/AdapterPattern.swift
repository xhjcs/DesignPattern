//
//  AdapterPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/8/13.
//

import Foundation

private protocol MediaPlayer {
    func play(audioType: String, fileName: String)
}

private protocol AdvancedMediaPlayer {
    func playVlc(fileName: String)
    func playMp4(fileName: String)
}

private class VlcPlayer : AdvancedMediaPlayer {
    func playVlc(fileName: String) {
        print("Playing vlc file. Name: \(fileName)")
    }
    
    func playMp4(fileName: String) {
        // do nothing
    }
}

private class Mp4Player : AdvancedMediaPlayer {
    func playVlc(fileName: String) {
        // do nothing
    }
    
    func playMp4(fileName: String) {
        print("Playing mp4 file. Name: \(fileName)")
    }
}

private class MediaAdapter : MediaPlayer {
    private var advancedMusicPlayer: AdvancedMediaPlayer?
    
    init(audioType: String) {
        if audioType == "vlc" {
            advancedMusicPlayer = VlcPlayer()
        } else if audioType == "mp4" {
            advancedMusicPlayer = Mp4Player()
        }
    }
    
    func play(audioType: String, fileName: String) {
        if audioType == "vlc" {
            advancedMusicPlayer?.playVlc(fileName: fileName)
        } else if audioType == "mp4" {
            advancedMusicPlayer?.playMp4(fileName: fileName)
        }
    }
}

private class AudioPlayer : MediaPlayer {
    
    func play(audioType: String, fileName: String) {
        if audioType == "mp3" {
            print("Playing mp3 file. Name: \(fileName)")
        } else if (audioType == "vlc" || audioType == "mp4") {
            MediaAdapter(audioType: audioType).play(audioType: audioType, fileName: fileName)
        } else {
            print("Invalid media. \(audioType) format not supported")
        }
    }
}

class AdapterPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "适配器模式"
    }
    
    func run() {
        let audioPlayer = AudioPlayer()
        audioPlayer.play(audioType: "mp3", fileName: "beyond the horizon.mp3")
        audioPlayer.play(audioType: "mp4", fileName: "alone.mp4")
        audioPlayer.play(audioType: "vlc", fileName: "far far away.vlc")
        audioPlayer.play(audioType: "avi", fileName: "mind me.avi")
    }
}


