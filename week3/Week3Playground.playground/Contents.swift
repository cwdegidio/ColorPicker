import Cocoa

// part (a)
var nums: [Int] = Array(0...20)

for num in nums where num % 2 == 0 {
    print(num)
}


// part (b)
let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"
var vowelsCount = ["a": 0, "e": 0, "i": 0, "o": 0, "u": 0]

for char in sentence {
    let currentChar = char.lowercased()
    
    if let oldCount = vowelsCount[currentChar] {
        let increasedCount = oldCount + 1
        vowelsCount.updateValue(increasedCount, forKey: currentChar)
    }
}

vowelsCount


// part (c)
let ints1 = Array(0...4)
let ints2 = Array(0...4)

for int1 in ints1 {
    for int2 in ints2 {
        print("\(int1) * \(int2) = \(int1 * int2)")
    }
}


// part (d)
func average(nums: [Int]?) -> Void {
    if let nums {
        let average = nums.reduce(0, +) / nums.count
        print("The average of the values in the array is \(average).")
    } else {
        print("The array is nil. Calculating the average is impossible.")
    }
}

average(nums: nums)

let optionalArray: [Int]? = nil
average(nums: optionalArray)


// part (e)
struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    
    func details() {
        print("Name: \(firstName) \(lastName), Age: \(age)")
    }
}

let curtis = Person(firstName: "Curtis", lastName: "DeGidio", age: 44)

curtis.details()


// part (f)
class Student {
    let person: Person
    let grades: [Int]
    
    init(person: Person, grades: [Int]) {
        self.person = person
        self.grades = grades
    }
    
    func calculateAverageGrade() -> Double {
        Double(grades.reduce(0, +)) / Double(grades.count)
    }
    
    func details() -> Void {
        print("Name: \(person.firstName) \(person.lastName), Age: \(person.age), GPA: \(self.calculateAverageGrade()).")
    }
}

let curtisD = Student(
                person: Person(firstName: "Curtis", lastName: "DeGidio", age: 43),
                grades: [94, 99, 81, 100, 79]
              )

curtisD.details()

// Part 3 - Above and Beyond
struct Square {
  var side: Int
  func area() -> Int {
    return side * side
  }
}

class Rectangle {
  var length: Int
  var width: Int
  init(length: Int, width: Int) {
    self.length = length
    self.width = width
  }
  func area() -> Int {
    return length * width
  }
}

var square1 = Square(side: 4)
var square2 = square1
square2.side = 5
print("Area: square1 - \(square1.area()) square2 - \(square2.area())")

var rectangle1 = Rectangle(length: 4, width: 4)
var rectangle2 = rectangle1
rectangle2.length = 5
print("Area: rectangle1 - \(rectangle1.area()) rectangle2 - \(rectangle2.area())")

