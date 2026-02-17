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
    
     
   
    static let students: [Student] = [
        Student(name: "John", age: 18, grade: [78, 85, 90]),
        Student(name: "Jane", age: 19, grade: [92, 94, 89]),
        Student(name: "Bob", age: 17, grade: [58, 37, 62])
    ]
    
    static func averageGrade(students: [Student]) -> Double {
        guard !students.isEmpty else {
            return 0.0
        }
        
        var totalGradePoints: Int = 0
       
        for student in students {
       
            for grade in student.grade {
                totalGradePoints += grade
            }
        }

        
        let totalNumberOfGrades = students.reduce(0) { sum, student in
            sum + student.grade.count
        }

        
        return Double(totalGradePoints) / Double(totalNumberOfGrades)
    }
    
    
    func StudentAverageGrade() -> Double {
        let totalNumberOfGrades = self.grade.count
        guard totalNumberOfGrades > 0 else {
            return 0.0
        }
        
        let totalGradePoints = self.grade.reduce(0, +)
        
        return Double(totalGradePoints) / Double(totalNumberOfGrades)
    }
    
    func studentSummary () -> String {
        
            return "Student:\(name) \nAverage: \(StudentAverageGrade())\nStatus: \(StudentAverageGrade() >= 60 ? "Passing" : "Failing")"
        }
        
   
    
        
            
    


}

var currentIndex = 0

   // 2. Create a function to show and move to the next student
   
@MainActor func showNextStudent() {
       if currentIndex < Student.students.count {
           var currentStudent = Student.students[currentIndex]
           print(currentStudent.studentSummary())
           
           // Increment the index for the next call
           currentIndex += 1
       } else {
           print("No more students in the list!")

   
       }
   }

let overallAverage = Student.averageGrade(students: Student.students)
let StudentsAverage = Student.students[0].StudentAverageGrade()
let StudentSummary = Student.students[0].studentSummary()




showNextStudent()
showNextStudent()
showNextStudent()
print("The overall average grade is: \(overallAverage)")











