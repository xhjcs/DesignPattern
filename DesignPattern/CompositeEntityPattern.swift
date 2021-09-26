//
//  CompositeEntityPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/26.
//

import Foundation

private class DependentObject1 {
    var data = ""
}

private class DependentObject2 {
    var data = ""
}

private class CoarseGrainedObject {
    let do1 = DependentObject1()
    let do2 = DependentObject2()
    
    func setData(data1: String, data2: String) {
        do1.data = data1
        do2.data = data2
    }
    
    func getData() -> [String] {
        return [do1.data, do2.data]
    }
}

private class CompositeEntity {
    private let cgo = CoarseGrainedObject()
    
    func setData(data1: String, data2: String) {
        cgo.setData(data1: data1, data2: data2)
    }
    
    func getData() -> [String] {
        return cgo.getData()
    }
}

private class Client {
    private let compositeEntity = CompositeEntity()
    
    func printData() {
        compositeEntity.getData().forEach { print("Data: \($0)") }
    }
    
    func setData(data1: String, data2: String) {
        compositeEntity.setData(data1: data1, data2: data2)
    }
}

class CompositeEntityPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "组合实体模式"
    }
    
    func run() {
        let client = Client()
        client.setData(data1: "Test", data2: "Data")
        client.printData()
        
        client.setData(data1: "Second Test", data2: "Data1")
        client.printData()
    }
}
