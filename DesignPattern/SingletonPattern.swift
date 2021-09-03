//
//  SingletonPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/7/28.
//

import Foundation

private class SingleObject {
    static let instance = SingleObject()
    
    private init() {
        
    }
    
    func showMessage() {
        print("Hello World!")
    }
}

class SingletonPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "单例模式"
    }
    
    func run() {
        let object = SingleObject.instance
        object.showMessage()
    }
}
