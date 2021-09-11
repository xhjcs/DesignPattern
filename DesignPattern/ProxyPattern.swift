//
//  DesignPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/6.
//

import Foundation

private protocol Image {
    func display()
}

private class RealImage : Image {
    private let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
        self.loadFromDisk(fileName: fileName)
    }
    
    func loadFromDisk(fileName: String) {
        print("Loading \(fileName)")
    }
    
    func display() {
        print("Displaying \(fileName)")
    }
}

private class ProxyImage : Image {
    private lazy var realImage: RealImage = {
        return RealImage(fileName: fileName)
    }()
    private let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func display() {
        realImage.display()
    }
}

class ProxyPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "代理模式"
    }
    
    func run() {
        let  image = ProxyImage(fileName: "test_10mb.jpg")
        
        image.display()
        print("")
        image.display()
    }
}
