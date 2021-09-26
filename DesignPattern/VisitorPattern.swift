//
//  VisitorPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/24.
//

import Foundation

private protocol ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor)
}

private class Keyboard : ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor) {
        computerPartVisitor.visit(keyboard: self)
    }
}

private class Monitor : ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor) {
        computerPartVisitor.visit(monitor: self)
    }
}

private class Mouse : ComputerPart {
    func accept(computerPartVisitor: ComputerPartVisitor) {
        computerPartVisitor.visit(mouse: self)
    }
}

private class Computer : ComputerPart {
    let parts: [ComputerPart] = [Mouse(), Keyboard(), Monitor()]
    
    func accept(computerPartVisitor: ComputerPartVisitor) {
        parts.forEach { $0.accept(computerPartVisitor: computerPartVisitor) }
        computerPartVisitor.visit(computer: self)
    }
}

private protocol ComputerPartVisitor {
    func visit(computer: Computer)
    func visit(mouse: Mouse)
    func visit(keyboard: Keyboard)
    func visit(monitor: Monitor)
}

private class ComputerPartDisplayVisitor : ComputerPartVisitor {
    func visit(computer: Computer) {
        print("Displaying Computer.")
    }
    
    func visit(mouse: Mouse) {
        print("Displaying Mouse.")
    }
    
    func visit(keyboard: Keyboard) {
        print("Displaying Keyboard.")
    }
    
    func visit(monitor: Monitor) {
        print("Displaying Monitor.")
    }
}

class VisitorPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "访问者模式"
    }
    
    func run() {
        Computer().accept(computerPartVisitor: ComputerPartDisplayVisitor())
    }
}
