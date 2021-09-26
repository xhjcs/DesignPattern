//
//  DataAccessObjectPattern.swift
//  DesignPattern
//
//  Created by Heikki on 2021/9/26.
//

import Foundation

private class Student {
    var name: String
    let rollNo: Int
    
    init(name: String, rollNo: Int) {
        self.name = name
        self.rollNo = rollNo
    }
}

private protocol StudentDao {
    func getAllStudents() -> [Student]
    func getStudent(rollNo: Int) -> Student
    func updateStudent(student: Student)
    func deleteStudent(student: Student)
}

private class StudentDaoImpl : StudentDao {
    var students = [Student]()
    
    init() {
        let student1 = Student(name: "Robert", rollNo: 0)
        let student2 = Student(name: "John", rollNo: 1)
        students.append(student1)
        students.append(student2)
    }
    
    func deleteStudent(student: Student) {
        students.remove(at: student.rollNo)
        print("Student: Roll No \(student.rollNo), deleted from database")
    }
    
    func getAllStudents() -> [Student] {
        return students
    }
    
    func getStudent(rollNo: Int) -> Student {
        return students[rollNo]
    }
    
    func updateStudent(student: Student) {
        students[student.rollNo].name = student.name
        print("Student: Roll No \(student.rollNo), updated in the databse")
    }
}

class DaoPatternDemo : DesignPatternDemo {
    func getName() -> String {
        return "DAO模式"
    }
    
    func run() {
        let studentDao = StudentDaoImpl()
        
        // 输出所有学生
        studentDao.getAllStudents().forEach { print("Student: [RollNo : \($0.rollNo), Name : \($0.name) ]") }
        
        // 更新学生
        var student = studentDao.getStudent(rollNo: 0)
        student.name = "Michael"
        studentDao.updateStudent(student: student)
        
        // 获取学生
        student = studentDao.getStudent(rollNo: 0)
        print("Student: [RollNo: \(student.rollNo), Name : \(student.name) ]")
    }
}
