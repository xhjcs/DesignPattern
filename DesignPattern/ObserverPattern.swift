//
//  ObserverPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/17.
//

import Foundation

private class Subject {
    private var observers = [Observer]()
    
    var state: Int = 0 {
        didSet {
            notifyAllObservers()
        }
    }
    
    func attach(observer: Observer) {
        observers.append(observer)
    }
    
    func notifyAllObservers() {
        observers.forEach { $0.update() }
    }
}

private class Observer {
    var subject = Subject()
    
    init(subject: Subject) {
        self.subject = subject
        self.subject.attach(observer: self)
    }
    
    func update() {}
}

private class BinaryObserver : Observer {
    
    override func update() {
        print("Binary String: \(String(subject.state, radix: 2))")
    }
}

private class OctalObserver : Observer {
    
    override func update() {
        print("Octal String: \(String(subject.state, radix: 8))")
    }
}

private class HexObserver : Observer {
    
    override func update() {
        print("Hex String: \(String(subject.state, radix: 16))")
    }
}

class ObserverPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "观察者模式"
    }
    
    func run() {
        let subject = Subject()
        
        let _ = BinaryObserver(subject: subject)
        let _ = OctalObserver(subject: subject)
        let _ = HexObserver(subject: subject)
        
        print("First state change: 15")
        subject.state = 15
        
        print("Second state change: 10")
        subject.state = 10
    }
}
