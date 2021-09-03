//
//  CompositePattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/8/17.
//

import Foundation

private class Employee {
    private let name: String
    private let dept: String
    private let salary: Int
    private(set) var subordinates = [Employee]()
    
    init(name: String, dept: String, sal: Int) {
        self.name = name
        self.dept = dept
        self.salary = sal
    }
    
    func add(e: Employee) {
        subordinates.append(e)
    }
    
    func remove(e: Employee) {
        subordinates = subordinates.filter { $0 !== e }
    }
    
    func toString() -> String {
        return "Employee :[ Name : \(name), dept : \(dept), salary : \(salary) ]"
    }
    
    func showInfo() {
        print(toString())
        subordinates.forEach { $0 .showInfo() }
    }
}

class CompositePatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "组合模式"
    }
    
    func run() {
        let CEO = Employee(name: "John", dept: "CEO", sal: 30000)
        
        let headSales = Employee(name: "Robert", dept: "Head Sales", sal: 20000)
        
        let headMarketing = Employee(name: "Michel", dept: "Head Marketing", sal: 20000)
        
        let clerk1 = Employee(name: "Laura", dept: "Marketing", sal: 10000)
        let clerk2 = Employee(name: "Bob", dept: "Marketing", sal: 10000)
        
        let salesExecutive1 = Employee(name: "Richard", dept: "Sales", sal: 10000)
        let salesExecutive2 = Employee(name: "Rob", dept: "Sales", sal: 10000)
        
        CEO.add(e: headSales)
        CEO.add(e: headMarketing)
        
        headSales.add(e: salesExecutive1)
        headSales.add(e: salesExecutive2)
        
        headMarketing.add(e: clerk1)
        headMarketing.add(e: clerk2)
        
        CEO.showInfo()
    }
}
