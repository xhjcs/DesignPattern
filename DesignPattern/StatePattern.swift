//
//  StatePattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/22.
//

import Foundation

private  protocol State {
    
    func doAction(context: Context)
    
    func toString() -> String
}

private class Context {
    var state: State = StopState()
}

private class StartState : State {
    func doAction(context: Context) {
        print("Player is in start state")
        context.state = self
    }
    
    func toString() -> String {
        return "Start State"
    }
}

private class StopState : State {
    func doAction(context: Context) {
        print("Player is in stop state")
        context.state = self
    }
    
    func toString() -> String {
        return "Stop State"
    }
}

class StatePatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "状态模式"
    }
    
    func run() {
        let context = Context()
        
        let startState = StartState()
        startState.doAction(context: context)
        
        print(context.state.toString())
        
        let stopState = StopState()
        stopState.doAction(context: context)
        
        print(context.state.toString())
    }
}
