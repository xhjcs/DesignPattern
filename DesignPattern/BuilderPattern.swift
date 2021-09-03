//
//  BuilderPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/7/28.
//

import Foundation

private protocol Packing {
    func pack() -> String
}

private protocol Item {
    func name() -> String
    func packing() -> Packing
    func price() -> Float
}

private class Wrapper : Packing {
    func pack() -> String {
        return "Wrapper"
    }
}

private class Bottle : Packing {
    func pack() -> String {
        return "Bottle"
    }
}

private class Burger : Item {
    func name() -> String {
        return ""
    }
    func packing() -> Packing {
        return Wrapper()
    }
    func price() -> Float {
        0
    }
}

private class ColdDrink : Item {
    func name() -> String {
        return ""
    }
    func packing() -> Packing {
        return Bottle()
    }
    func price() -> Float {
        0
    }
}

private class VegBurger : Burger {
    override func name() -> String {
        return "Veg Burger"
    }
    override func price() -> Float {
        return 25.0
    }
}

private class ChickenBurger : Burger {
    override func name() -> String {
        return "Chicken Burger"
    }
    override func price() -> Float {
        return 50.5
    }
}

private class Coke : ColdDrink {
    override func name() -> String {
        return "Coke"
    }
    override func price() -> Float {
        return 30.0
    }
}

private class Pepsi : ColdDrink {
    override func name() -> String {
        return "Pepsi"
    }
    override func price() -> Float {
        return 35.0
    }
}

private class Meal {
    private var items = [Item]()
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func getCost() -> Float {
        return items.reduce(0, { $0 + $1.price() })
    }
    
    func showItems() {
        items.forEach {
            print("Item: \($0.name()), Packing : \($0.packing()), Price : \($0.price())")
        }
    }
}

private class MealBuilder {
    func prepareVegMeal() -> Meal {
        let meal = Meal()
        meal.addItem(item: VegBurger())
        meal.addItem(item: Coke())
        return meal
    }
    func prepareNonVegMeal() -> Meal {
        let meal = Meal()
        meal.addItem(item: ChickenBurger())
        meal.addItem(item: Pepsi())
        return meal
    }
}

class BuilderPatternDemo : DesignPatternDemo {
    func getName() -> String {
        "建造者模式"
    }
    
    func run() {
        let mealBuilder = MealBuilder()
        
        let vegMeal = mealBuilder.prepareVegMeal()
        print("Veg Meal")
        vegMeal.showItems()
        print("Total Cost: \(vegMeal.getCost())")
        
        let nonVegMeal = mealBuilder.prepareNonVegMeal()
        print("\nNon-Veg Meal")
        nonVegMeal.showItems()
        print("Total Coast: \(nonVegMeal.getCost())")
    }
}


