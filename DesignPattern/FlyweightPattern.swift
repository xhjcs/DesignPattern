//
//  FlyweightPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/6.
//

import Foundation

private protocol Shape {
    func draw()
}

private class Circle : Shape {
    private let color: String
    private var x: Int = 0
    private var y: Int = 0
    private var radius: Int = 0
    
    init(color: String) {
        self.color = color
    }
    
    func setX(x: Int) {
        self.x = x
    }
    
    func setY(y: Int) {
        self.y = y
    }
    
    func setRadius(radius: Int) {
        self.radius = radius
    }
    
    func draw() {
        print("Circle::Draw() [Color : \(color), x: \(x), y: \(y), radius: \(radius)]")
    }
}

private class ShapeFactory {
    private static var circleMap = [String : Circle]()
    
    static func getCircle(color: String) -> Circle {
        var circle = circleMap[color]
        if circle == nil {
            circle = Circle(color: color)
            circleMap[color] = circle
            print("Creating circle of color : \(color)")
        }
        return circle!
    }
}

class FlyweightPatternDemo : DesignPatternDemo {
    private let color = ["Red", "Green", "Blue", "White", "Black"]
    
    private func getRandomColor() -> String {
        return color[Int.random(in: 0..<color.count)]
    }
    
    private func getRandomX() -> Int {
        return Int.random(in: 0..<100)
    }
    
    private func getRandomY() -> Int {
        return Int.random(in: 0..<100)
    }
    
    func getName() -> String {
        return "享元模式"
    }
    
    func run() {
        for _ in 0..<20 {
            let circle = ShapeFactory.getCircle(color: getRandomColor())
            circle.setX(x: getRandomX())
            circle.setY(y: getRandomY())
            circle.setRadius(radius: 100)
            circle.draw()
        }
    }
}
