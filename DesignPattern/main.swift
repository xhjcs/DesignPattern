//
//  main.swift
//  DesignPattern
//
//  Created by Heikki on 2021/7/27.
//

import Foundation

protocol DesignPatternDemo {
    func getName() -> String
    func run()
}

let demos : [DesignPatternDemo] = [
    FactoryPatternDemo(),
    AbstractFactoryPatternDemo(),
    SingletonPatternDemo(),
    BuilderPatternDemo(),
    PrototypePatternDemo(),
    AdapterPatternDemo(),
    BridgePatternDemo(),
    FilterPatternDemo(),
    CompositePatternDemo(),
    DecoratorPatternDemo(),
    FacadePatternDemo(),
    FlyweightPatternDemo(),
    ProxyPatternDemo(),
    ChainOfResponsibilityPattern(),
    CommandPatternDemo(),
    InterpreterPatternDemo(),
    IteratorPatternDemo(),
    MediatorPatternDemo(),
    MementoPatternDemo(),
    ObserverPatternDemo(),
    StatePatternDemo(),
    NullPatternDemo(),
    StrategyPatternDemo(),
    VisitorPatternDemo(),
    MVCPatternDemo(),
    BusinessDelegatePatternDemo(),
]

demos.forEach({
    print("-----------\($0.getName())-----------")
    $0.run()
    print("\n")
})
