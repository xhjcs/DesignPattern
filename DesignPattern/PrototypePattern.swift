//
//  PrototypePattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/8/1.
//

import Foundation

private class Shape {
    var id: String = ""
    internal var type: String = ""
    
    func draw() {
        
    }
}

private class Rectangle : Shape {
    override init() {
        super.init()
        type = "Rectangle"
    }
    
    override func draw() {
        print("Inside Rectangle::draw() method.")
    }
}

private class Square : Shape {
    override init() {
        super.init()
        type = "Square"
    }
    
    override func draw() {
        print("Inside Square::draw() method.")
    }
}

private class Circle : Shape {
    override init() {
        super.init()
        type = "Circle"
    }
    override func draw() {
        print("Inside Circle::draw() method.")
    }
}

private class ShapeCache {
    private static var shapeMap = [String : Shape]()
    
    static func getShape(shapeId: String) -> Shape? {
        return shapeMap[shapeId]
    }
    
    static func loadCache() {
        let circle = Circle()
        circle.id = "1"
        shapeMap[circle.id] = circle
        
        let square = Square()
        square.id = "2"
        shapeMap[square.id] = square
        
        let rectangle = Rectangle()
        rectangle.id = "3"
        shapeMap[rectangle.id] = rectangle
    }
}

class PrototypePatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "原型模式"
    }
    
    func run() {
        ShapeCache.loadCache()
        
        if let type = ShapeCache.getShape(shapeId: "1")?.type {
            print("Shape: \(type)")
        }
        
        if let type = ShapeCache.getShape(shapeId: "2")?.type {
            print("Shape: \(type)")
        }
        
        if let type = ShapeCache.getShape(shapeId: "3")?.type {
            print("Shape: \(type)")
        }
        
    }
}
