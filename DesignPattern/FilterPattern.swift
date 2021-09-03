//
//  FilterPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/8/16.
//

import Foundation

private class Person : CustomStringConvertible {
    let name: String
    let gender: String
    let maritalStatus: String
    
    var description: String {
        return "Person: [ Name : \(name), Gender : \(gender), Status : \(maritalStatus)]"
    }
    
    init(name: String, gender: String, maritalStatus: String) {
        self.name = name
        self.gender = gender
        self.maritalStatus = maritalStatus
    }
}

private protocol Filter {
    func meetFilter(persons: [Person]) -> [Person]
}

private class FilterMale : Filter {
    func meetFilter(persons: [Person]) -> [Person] {
        return persons.filter { $0.gender == "Male" }
    }
}

private class FilterFemale : Filter {
    func meetFilter(persons: [Person]) -> [Person] {
        return persons.filter { $0.gender == "Female" }
    }
}

private class FilterSingle : Filter {
    func meetFilter(persons: [Person]) -> [Person] {
        return persons.filter { $0.maritalStatus == "Single" }
    }
}

private class AndFilter : Filter {
    private let filter: Filter
    private let otherFilter: Filter
    
    init(criteria: Filter, otherCirteria: Filter) {
        self.filter = criteria
        self.otherFilter = otherCirteria
    }
    
    func meetFilter(persons: [Person]) -> [Person] {
        let firstCriteriaPersons = filter.meetFilter(persons: persons)
        return otherFilter.meetFilter(persons: firstCriteriaPersons)
    }
}

private class OrFilter : Filter {
    private let filter: Filter
    private let otherFilter: Filter
    
    init(criteria: Filter, otherCirteria: Filter) {
        self.filter = criteria
        self.otherFilter = otherCirteria
    }
    
    func meetFilter(persons: [Person]) -> [Person] {
        let firstCriteria = filter.meetFilter(persons: persons)
        let otherCriteriaPersons = otherFilter.meetFilter(persons: persons)
        
        var set = [Person]()
        
        (firstCriteria + otherCriteriaPersons).forEach { set.append($0) }
        
        return Array(set)
    }
}

class FilterPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "过滤器模式"
    }
    
    func run() {
        var persons = [Person]()
        
        persons.append(Person(name: "Robert", gender: "Male", maritalStatus: "Single"))
        persons.append(Person(name: "John", gender: "Male", maritalStatus: "Married"))
        persons.append(Person(name: "Laura", gender: "Female", maritalStatus: "Married"))
        persons.append(Person(name: "Diana", gender: "Female", maritalStatus: "Single"))
        persons.append(Person(name: "Mike", gender: "Male", maritalStatus: "Single"))
        persons.append(Person(name: "Bobby", gender: "Male", maritalStatus: "Single"))
        
        let male = FilterMale()
        let female = FilterFemale()
        let single = FilterSingle()
        let singleMale = AndFilter(criteria: single, otherCirteria: male)
        let singleOrFemale = OrFilter(criteria: single, otherCirteria: female)
        
        print("Males: ")
        male.meetFilter(persons: persons).forEach { print($0) }
        
        print("\nFemales: ")
        female.meetFilter(persons: persons).forEach { print($0) }
        
        print("\nSingle Males: ")
        singleMale.meetFilter(persons: persons).forEach { print($0) }
        
        print("\nSingle Or Females: ")
        singleOrFemale.meetFilter(persons: persons).forEach { print($0) }
    }
}
