//
//  MediatorPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/16.
//

import Foundation

private class ChatRoom {
    static func showMessage(user: User, message: String) {
        print("\(Date()) [\(user.name)] : \(message)")
    }
}

private class User {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sendMessage(message: String) {
        ChatRoom.showMessage(user: self, message: message)
    }
}

class MediatorPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "中介者模式"
    }
    
    func run() {
        let robert = User(name: "Robert")
        let john = User(name: "John")
        
        robert.sendMessage(message: "Hi! John!")
        john.sendMessage(message: "Hello! Robert!")
    }
}
