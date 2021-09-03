//
//  BridgePattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/8/16.
//

import Foundation

private protocol DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int)
}

private class RedCircle : DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Circle[color: red, radius: \(radius), x: \(x), y: \(y)]")
    }
}

private class GreenCircle : DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Circle[color: green, redius: \(radius), x: \(x), y: \(y)]")
    }
}

private class Shape {
    var drawAPI: DrawAPI
    
    init(drawAPI: DrawAPI) {
        self.drawAPI = drawAPI
    }
    
    func draw() {
    }
}

private class Circle : Shape {
    let x: Int, y: Int, radius: Int
    
    init(x: Int, y: Int, radius: Int, drawAPI: DrawAPI) {
        self.x = x
        self.y = y
        self.radius = radius
        super.init(drawAPI: drawAPI)
    }
    
    override func draw() {
        drawAPI.drawCircle(radius: radius, x: x, y: y)
    }
}

class BridgePatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "桥接模式"
    }
    
    func run() {
        let redCircle = Circle(x: 100, y: 100, radius: 10, drawAPI: RedCircle())
        let greenCircle = Circle(x: 100, y: 100, radius: 10, drawAPI: GreenCircle())
        
        redCircle.draw()
        greenCircle.draw()
    }
}
