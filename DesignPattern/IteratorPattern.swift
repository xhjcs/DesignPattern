//
//  IteratorPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/15.
//

import Foundation

private protocol Iterator {
    func hasNext() -> Bool
    func next() -> String?
}

private protocol Container {
    func getIterator() -> Iterator
}

private class NameRepository : Container {
    func getIterator() -> Iterator {
        return NameIterator(container: self)
    }
    
    let names = ["Robert", "John", "Julie", "Lora"]
    
    private class NameIterator : Iterator {
        var index = 0
        var container: NameRepository
        
        init(container: NameRepository) {
            self.container = container
        }
        
        func hasNext() -> Bool {
            return index < container.names.count
        }
        
        func next() -> String? {
            guard hasNext() else {
                return nil
            }
            let next = container.names[index]
            index += 1
            return next
        }
    }
}

class IteratorPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "迭代器模式"
    }
    
    func run() {
        let nameRepository = NameRepository()
        let iterator = nameRepository.getIterator()
        
        while iterator.hasNext() {
            print("Name : \(iterator.next()!)")
        }
    }
}
