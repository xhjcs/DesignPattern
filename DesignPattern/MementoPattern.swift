//
//  MementoPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/16.
//

import Foundation

private class Memento {
    let state: String
    
    init(state: String) {
        self.state = state
    }
}

private class Originator {
    var state = ""
    
    func saveStateToMemento() -> Memento {
        return Memento(state: state)
    }
    
    func getStateFromMemento(memento: Memento) {
        state = memento.state
    }
}

private class CareTaker {
    private var mementoList = [Memento]()
    
    func add(state: Memento) {
        mementoList.append(state)
    }
    
    func get(index: Int) -> Memento {
        return mementoList[index]
    }
}

class MementoPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "备忘录模式"
    }
    
    func run() {
        let originator = Originator()
        let careTaker = CareTaker()
        
        originator.state = "State #1"
        originator.state = "State #2"
        careTaker.add(state: originator.saveStateToMemento())
        
        originator.state = "State #3"
        careTaker.add(state: originator.saveStateToMemento())
        
        originator.state = "State #4"
        
        print("Current State: \(originator.state)")
        
        originator.getStateFromMemento(memento: careTaker.get(index: 0))
        print("First saved State: \(originator.state)")
        
        originator.getStateFromMemento(memento: careTaker.get(index: 1))
        print("Second saved State: \(originator.state)")
    }
}
