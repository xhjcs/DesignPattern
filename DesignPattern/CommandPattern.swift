//
//  CommandPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/10.
//

import Foundation

private protocol Order {
    func execute()
}

private class Stock {
    private let name = "ABC"
    private let quantity = 10
    
    func buy() {
        print("Stock [ Name: \(name) + Quantity: \(quantity) ] bought")
    }
    
    func sell() {
        print("Stock [ Name: \(name) + Quantity: \(quantity) ] sold")
    }
}

private class BuyStock : Order {
    private let stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    func execute() {
        stock.buy()
    }
}

private class SellStock : Order {
    private let stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    func execute() {
        stock.sell()
    }
}

private class Broker {
    private var orderList = [Order]()
    
    func takeOrder(order: Order) {
        orderList.append(order)
    }
    
    func placeOrders() {
        orderList.forEach { $0.execute() }
        orderList.removeAll()
    }
}

class CommandPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "命令模式"
    }
    
    func run() {
        let stock = Stock()
        
        let buyStockOrder = BuyStock(stock: stock)
        let sellStockOrder = SellStock(stock: stock)
        
        let broker = Broker()
        broker.takeOrder(order: buyStockOrder)
        broker.takeOrder(order: sellStockOrder)
        
        broker.placeOrders()
    }
}
