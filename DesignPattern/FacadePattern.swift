//
//  FacadePattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/8/25.
//

import Foundation

private protocol Shape {
    func draw()
}

private class Rectangle : Shape {
    func draw() {
        print("Reactangle::draw()")
    }
}

private class Square : Shape {
    func draw() {
        print("Square::draw()")
    }
}

private class Circle : Shape {
    func draw() {
        print("Circle:draw()")
    }
}

private class ShapeMaker {
    private let circle: Shape
    private let rectangle: Shape
    private let square: Shape
    
    init() {
        self.circle = Circle()
        self.rectangle = Rectangle()
        self.square = Square()
    }
    
    func drawCircle() {
        circle.draw()
    }
    
    func drawRectangle() {
        rectangle.draw()
    }
    
    func drawSquare() {
        square.draw()
    }
}

class FacadePatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "外观模式"
    }
    
    func run() {
        let shapeMaker = ShapeMaker()
        
        shapeMaker.drawCircle()
        shapeMaker.drawRectangle()
        shapeMaker.drawSquare()
    }
}
