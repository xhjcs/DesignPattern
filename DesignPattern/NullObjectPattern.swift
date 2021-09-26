//
//  NullObjectPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/22.
//

import Foundation

private protocol AbstractCustomer {
    var name: String { get }
    
    func isNil() -> Bool
}

private class RealCustomer : AbstractCustomer {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func isNil() -> Bool {
        return false
    }
}

private class NullCustomer : AbstractCustomer {
    let name = "Not Available in Customer Database"
    
    func isNil() -> Bool {
        return true
    }
}

private class CustomerFactory {
    private static let names = ["Rob", "Joe", "Julie"]
    
    static func getCustomer(name: String) -> AbstractCustomer {
        return names.contains(name) ? RealCustomer(name: name) : NullCustomer()
    }
}

class NullPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "空对象模式"
    }
    
    func run() {
        let customer1 = CustomerFactory.getCustomer(name: "Rob")
        let customer2 = CustomerFactory.getCustomer(name: "Bob")
        let customer3 = CustomerFactory.getCustomer(name: "Julie")
        let customer4 = CustomerFactory.getCustomer(name: "Laura")
        
        print("Customers")
        print(customer1.name)
        print(customer2.name)
        print(customer3.name)
        print(customer4.name)
    }
}
