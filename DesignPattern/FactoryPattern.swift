//
//  FactoryPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/7/27.
//

import Foundation

private protocol Shape {
    func draw()
}

private class Rectangle : Shape {
    func draw() {
        print("Inside Rectangle::draw() method.")
    }
}

private class Square : Shape {
    func draw() {
        print("Inside Square::draw() method.")
    }
}

private class Circle : Shape {
    func draw() {
        print("Inside Circle::draw() method.")
    }
}

private class ShapeFactory {
    func getShape(shapeType: String) -> Shape? {
        if shapeType == "Rectangle" {
            return Rectangle()
        } else if shapeType == "Square" {
            return Square()
        } else if shapeType == "Circle" {
            return Circle()
        }
        return nil
    }
}

class FactoryPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "工厂模式"
    }
    
    func run() {
        let shapeFactory = ShapeFactory()
        
        shapeFactory.getShape(shapeType: "Rectangle")?.draw()
        shapeFactory.getShape(shapeType: "Square")?.draw()
        shapeFactory.getShape(shapeType: "Circle")?.draw()
    }
}
