//
//  InterpreterPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/15.
//

import Foundation

private protocol Expression {
    func interpret(context: String) -> Bool
}

private class TerminalExpression : Expression {
    private let data: String
    
    init(data: String) {
        self.data = data
    }
    
    func interpret(context: String) -> Bool {
        return context.contains(data)
    }
}

private class OrExpression : Expression {
    private let expr1: Expression
    private let expr2: Expression
    
    init(expr1: Expression, expr2: Expression) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpret(context: String) -> Bool {
        return expr1.interpret(context: context) || expr2.interpret(context: context)
    }
}

private class AndExpression : Expression {
    private let expr1: Expression
    private let expr2: Expression
    
    init(expr1: Expression, expr2: Expression) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpret(context: String) -> Bool {
        return expr1.interpret(context: context) && expr2.interpret(context: context)
    }
}

class InterpreterPatternDemo : DesignPatternDemo {
    private let maleExpression: Expression = {
        let robert = TerminalExpression(data: "Robert")
        let john = TerminalExpression(data: "John")
        return OrExpression(expr1: robert, expr2: john)
    }()
    
    private let marriedWomanExpression: Expression = {
        let julie = TerminalExpression(data: "Julie")
        let married = TerminalExpression(data: "Married")
        return AndExpression(expr1: julie, expr2: married)
    }()
    
    func getName() -> String {
        return "解释器模式"
    }
    
    func run() {
        let isMale = maleExpression
        let isMarriedWoman = marriedWomanExpression
        
        print("John is male? \(isMale.interpret(context: "John"))")
        print("Julie is a married women? \(isMarriedWoman.interpret(context: "Married Julie"))")
    }
}
