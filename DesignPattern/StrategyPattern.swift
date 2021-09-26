//
//  StrategyPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/23.
//

import Foundation

private protocol Strategy {
    func doOperation(num1: Int, num2: Int) -> Int
}

private class OperationAdd : Strategy {
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}

private class OperationSubstract : Strategy {
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
}

private class OperationMultiply : Strategy {
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
}

private class Context {
    var strategy: Strategy?
    
    func executeStrategy(num1: Int, num2: Int) -> Int {
        guard let strategy = strategy else {
            return 0
        }
        return strategy.doOperation(num1: num1, num2: num2)
    }
}

class StrategyPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "策略模式"
    }
    
    func run() {
        let context = Context()
        
        context.strategy = OperationAdd()
        print("10 + 5 = ", context.executeStrategy(num1: 10, num2: 5))
        
        context.strategy = OperationSubstract()
        print("10 - 5 = ", context.executeStrategy(num1: 10, num2: 5))
        
        context.strategy = OperationMultiply()
        print("10 * 5 = ", context.executeStrategy(num1: 10, num2: 5))
    }
}
