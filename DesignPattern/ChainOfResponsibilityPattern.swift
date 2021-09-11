//
//  ChainOfResponsibilityPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/7.
//

import Foundation

private class AbstractLogger {
    static let INFO = 1
    static let DEBUG = 2
    static let ERROR = 3
    
    var level: Int
    
    init() {
        self.level = 0
    }
    
    var nextLogger: AbstractLogger?
    
    func logMessage(level: Int, message: String) {
        if self.level <= level {
            write(message: message)
        }
        if nextLogger != nil {
            nextLogger?.logMessage(level: level, message: message)
        }
    }
    
    func write(message: String) {
        
    }
}

private class ConsoleLogger : AbstractLogger {
    override init() {
        super.init()
        self.level = AbstractLogger.INFO
    }
    override func write(message: String) {
        print("Standard Console::Logger: \(message)")
    }
}

private class ErrorLogger : AbstractLogger {
    override init() {
        super.init()
        self.level = AbstractLogger.ERROR
    }
    override func write(message: String) {
        print("Error Console::Logger: \(message)")
    }
}

private class FileLogger : AbstractLogger {
    override init() {
        super.init()
        self.level = AbstractLogger.DEBUG
    }
    override func write(message: String) {
        print("File::Logger: \(message)")
    }
}

class ChainOfResponsibilityPattern : DesignPatternDemo {
    
    private static func getChainOfLoggers() -> AbstractLogger {
        let errorLogger = ErrorLogger()
        let fileLogger = FileLogger()
        let consoleLogger = ConsoleLogger()
        
        errorLogger.nextLogger = fileLogger
        fileLogger.nextLogger = consoleLogger
        
        return errorLogger
    }
    
    func getName() -> String {
        return "责任链模式"
    }
    
    func run() {
        let loggerChain = ChainOfResponsibilityPattern.getChainOfLoggers()
        
        loggerChain.logMessage(level: AbstractLogger.INFO, message: "This is an information.")
        loggerChain.logMessage(level: AbstractLogger.DEBUG, message: "This is a debug level information.")
        loggerChain.logMessage(level: AbstractLogger.ERROR, message: "This is an error information.")
    }
}
