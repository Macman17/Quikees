//
//  StudentGradeView.swift
//  103project-Cort6
//
//  Created by Naqui Darby on 2/3/26.
//

import SwiftUI

let students: [Student] = [
    Student(name: "John", age: 18, grade:[ 93, 83, 78]),
    Student(name: "Jane", age: 19, grade: [85, 88, 92]),
    Student(name: "Bob", age: 17, grade: [66, 49, 58]),
]

func averageGrade(for student: Student) -> Double {
    let total = student.grade.reduce(0, +)
    
    return Double(total) / Double(student.grade.count)

}

func courseaverageGrade(students: Student) -> Double {
    var totalGrade = 0
    
    for Student in students {
        totalGrade += Student.grade
    }
    
    return Double(totalGrade) / Double(students.grade.count)
}

struct StudentGradeView: View {
    var body: some View {
        
        ZStack{
            
            
            VStack {
                ForEach(students, id: \.name) { student in
                    VStack(alignment: .leading) {
                        Text(student.name)
                            .font(.headline)
                        Text("Age: \(student.age)")
                        Text("Average Grade: \(averageGrade(for: student), specifier: "%.2f")")
                        if averageGrade(for: student) >= 60.0 {
                            Text("Passed")
                                .foregroundColor(.green)
                        } else {
                            Text("Failed")
                                .foregroundColor(.red)
                        }
                        
                        
                    }.padding()
                        .border(Color.gray)
                        .cornerRadius(8)
                }
                VStack{
                    HStack {
                        Text("Average Grade for all students: \(courseaverageGrade(students: Student.grade), specifier: "%.2f")")
                    }
                }
            }
        }
    }
    
}

#Preview {
    StudentGradeView()
}
