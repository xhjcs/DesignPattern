//
//  AbstractFactoryPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/7/28.
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

private protocol Color {
    func fill()
}

private class Red : Color {
    func fill() {
        print("Inside Red::fill() method.")
    }
}

private class Green : Color {
    func fill() {
        print("Inside Green::fill() method.")
    }
}

private class Blue : Color {
    func fill() {
        print("Inside Blue::fill() method.")
    }
}

private class AbstractFactory {
    func getColor(color: String) -> Color? {
        return nil
    }
    func getShape(shapeType: String) -> Shape? {
        return nil
    }
}

private class ShapeFactory : AbstractFactory {
    
    override func getShape(shapeType: String) -> Shape? {
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

private class ColorFactory : AbstractFactory {
    
    override func getColor(color: String) -> Color? {
        if color == "Red" {
            return Red()
        } else if color == "Green" {
            return Green()
        } else if color == "Blue" {
            return Blue()
        }
        return nil
    }
    
}

private class FactoryProducer {
    static func getFactory(choice: String) -> AbstractFactory? {
        if choice == "SHAPE" {
            return ShapeFactory()
        } else if choice == "COLOR" {
            return ColorFactory()
        }
        return nil
    }
}

class AbstractFactoryPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "抽象工厂模式"
    }
    func run() {
        let shapeFactory = FactoryProducer.getFactory(choice: "SHAPE")
        shapeFactory?.getShape(shapeType: "Rectangle")?.draw()
        shapeFactory?.getShape(shapeType: "Square")?.draw()
        shapeFactory?.getShape(shapeType: "Circle")?.draw()
        
        let colorFactory = FactoryProducer.getFactory(choice: "COLOR")
        colorFactory?.getColor(color: "Red")?.fill()
        colorFactory?.getColor(color: "Green")?.fill()
        colorFactory?.getColor(color: "Blue")?.fill()
    }
}




