//
//  TemplatePattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/23.
//

import Foundation

private class Game {
    func initialize() {}
    func startPlay() {}
    func endPlay() {}
    // 模版
    func play() {
        // 初始化游戏
        initialize()
        // 开始游戏
        startPlay()
        // 结束游戏
        endPlay()
    }
}

private class Cricket : Game {
    override func initialize() {
        print("Cricket Game Initialize! Start playing.")
    }
    override func startPlay() {
        print("Cricket Game Started. Enjoy the game!")
    }
    override func endPlay() {
        print("Cricket Game Finished!")
    }
}

private class Football : Game {
    override func initialize() {
        print("Football Game Initialize! Start playing.")
    }
    
    override func startPlay() {
        print("Football Game Started. Enjoy the game!")
    }
    
    override func endPlay() {
        print("Football Game Finished!")
    }
}

class TemplatePatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "模版模式"
    }
    
    func run() {
        var game: Game = Cricket()
        game.play()
        print("")
        game = Football()
        game.play()
    }
}
