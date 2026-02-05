import UIKit


print("---Array---")

var studentsList: [String] = ["Abby", "Bobby", "Courtney", "Duke", "Eric"]

var gradesArray: [Int] = [90, 85, 78, 92, 88]

print("This is an array \(gradesArray)")


var names = Set<String>()
var gradesSet: Set<Int> = [ 43, 29, 90, 39]
print("This is a set: \(gradesSet)")

var dictionary: [String: Int] = ["Abby": 90, "Bobby": 85, "Courtney": 78, "Duke": 92, "Eric": 88]
print("This is a dictionary: \(dictionary)")


var studentName: [String] = ["Greg", "John", "Mark", "Sam", "Tim"]

print("Students: \(studentName)")

var studentIdSet: Set<String> = ["12342", "43433", "13444", "23434", "34343"]

print("Student Id: \(studentIdSet)")

var studentGradesDic: [String: Int] = ["Greg": 87, "John": 89, "Mark": 96, "Sam": 98, "Tim": 94]

print("Each student grades: \(studentGradesDic)")

var courseOffered: [String] = ["Math", "Science", "World History", "Reading"]

print("Offered course: \(courseOffered)")


var bookTitle: [String] = ["Gone with the wind", "Bye Bye Baby", "Ocean", "Make me hate you"]

print("Books Title: \(bookTitle)")

var bookISBN: Set<String> = ["1234567890", "0987654321", "1122334455", "6677889900"]

print("Books ISBN: \(bookISBN)")

var bookPrice: [String:Double] = ["Gone with the wind": 10, "Bye Bye Baby": 12, "Ocean": 15, "Make me hate you": 18]

print("Books: \(bookPrice)")

var bookTracking: [String] = ["05394929", "28448383", "1243434", "1347976"]

print("Tracking Number: \(bookTracking)")
