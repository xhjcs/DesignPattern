//
//  BusinessDelegatePattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/24.
//

import Foundation

private protocol BusinessService {
    func doProcessing()
}

private class EJBService : BusinessService {
    func doProcessing() {
        print("Processing task by invoking EJB Service")
    }
}

private class JMSService : BusinessService {
    func doProcessing() {
        print("Processing task by invoking JMS Service")
    }
}

private class BusinessLookUp {
    func getBusinessService(serviceType: String) -> BusinessService {
        return (serviceType == "EJB") ? EJBService() : JMSService()
    }
}

private class BusinessDelegate {
    private let lookupService = BusinessLookUp()
    var serviceType: String?
    
    func doTask() {
        guard let serviceType = serviceType else {
            return
        }

        lookupService.getBusinessService(serviceType: serviceType).doProcessing()
    }
}

private class Client {
    let businessService: BusinessDelegate
    
    init(businessService: BusinessDelegate) {
        self.businessService = businessService
    }
    
    func doTask() {
        businessService.doTask()
    }
}

class BusinessDelegatePatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "业务代表模式"
    }
    
    func run() {
        let businessDelegate = BusinessDelegate()
        businessDelegate.serviceType = "EJB"
        
        let client = Client(businessService: businessDelegate)
        client.doTask()
        
        businessDelegate.serviceType = "JMS"
        client.doTask()
    }
}
