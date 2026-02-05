import UIKit


class Student {
    var name: String
    var age: Int
    var grade: [Int]
    
    
    init(name: String, age: Int, grade: [Int]) {
        self.name = name
        self.age = age
        self.grade = grade
        
    }
 
    
    
}
       


var students: [Student] = [
    Student(name: "John", age: 18, grade:[ 93, 83, 78]),
    Student(name: "Jane", age: 19, grade: [85, 88, 92]),
    Student(name: "Bob", age: 17, grade: [66, 79, 58]),
]

func averageGrade(for student: Student) -> Double {
    let total = student.grade.reduce(0, +)
    return Double(total) / Double(student.grade.count)
}

func courseaverageGrade(students: [Student]) -> Double {
    var totalGrade = 0
    
    for student in students {
        totalGrade += student.grade
    }
    
    return Double(totalGrade) / Double(students.count)
}




