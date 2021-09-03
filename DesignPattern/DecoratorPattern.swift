//
//  DecoratorPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/8/23.
//

import Foundation

private protocol Shape {
    func draw()
}

private class Rectangle : Shape {
    func draw() {
        print("Shape: Reactangle")
    }
}

private class Circle : Shape {
    func draw() {
        print("Shape: Circle")
    }
}

private class ShapeDecorator : Shape {
    let decoratedShape: Shape
    
    init(decoratedShape: Shape) {
        self.decoratedShape = decoratedShape
    }
    
    func draw() {
        self.decoratedShape.draw()
    }
}

private class RedShapeDecorator : ShapeDecorator {
    
    override func draw() {
        decoratedShape.draw()
        setRedBorder(decorated: decoratedShape)
    }
    
    func setRedBorder(decorated: Shape) {
        print("Border Color: Red")
    }
}

class DecoratorPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "装饰器模式"
    }
    
    func run() {
        let circle = Circle()
        let redCircle = RedShapeDecorator(decoratedShape: Circle())
        let redRectangle = RedShapeDecorator(decoratedShape: Rectangle())
        
        print("Circle with normal border")
        circle.draw()
        
        print("\nCircle of red border")
        redCircle.draw()
        
        print("\nRectangle of red border")
        redRectangle.draw()
    }
}
