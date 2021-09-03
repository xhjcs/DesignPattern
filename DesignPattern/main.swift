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
]

demos.forEach({
    print("-----------\($0.getName())-----------")
    $0.run()
    print("\n")
})
