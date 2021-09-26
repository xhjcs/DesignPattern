//
//  MVCPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/24.
//

import Foundation

private class Student {
    var rollNo = ""
    var name = ""
    init(name: String, rollNo: String) {
        self.name = name
        self.rollNo = rollNo
    }
}

private class StudentView {
    func printStudentDetails(studentName: String, studentRollNo: String) {
        print("Student: ")
        print("Name: \(studentName)")
        print("Roll No: \(studentRollNo)")
    }
}

private class StudentController {
    let model: Student
    let view: StudentView
    
    init(model: Student, studentView: StudentView) {
        self.model = model
        self.view = studentView
    }
    
    func updateView() {
        view.printStudentDetails(studentName: model.name, studentRollNo: model.rollNo)
    }
}

class MVCPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "MVC 模式"
    }
    
    func run() {
        // 从数据库获取学生记录
        let model = retrieveStudentFromDatebase()
        
        // 创建一个视图：把学生详细信息输出到控制台
        let view = StudentView()
        
        let controller = StudentController(model: model, studentView: view)
        controller.updateView()
        
        // 更新模型数据
        controller.model.name = "John"
        controller.updateView()
    }
    
    private func retrieveStudentFromDatebase() -> Student {
        return Student(name: "Robert", rollNo: "10")
    }
}
