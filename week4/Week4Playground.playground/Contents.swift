import Cocoa

// part (a)

// original array from week 3 part (a)
// renamed as to not conflict with part (c)
var arrayOfNums: [Int] = Array(0...20)

// original method from week 3 part (d)
func average(nums: [Int]?) -> Void {
    if let nums {
        let average = nums.reduce(0, +) / nums.count
        print("The average of the values in the array is \(average).")
    } else {
        print("The array is nil. Calculating the average is impossible.")
    }
}

func average(nums: [Double]?) -> Double {
    if let nums {
        let average = Double(nums.reduce(0, +)) / Double(nums.count)
        return average
    } else {
        return 0.0
    }
}

func average(nums: [Int]?, numberOfElements: Int) -> Double {
    if let nums {
        let average = Double(nums.reduce(0, +)) / Double(numberOfElements)
        return average
    } else {
        return 0.0
    }
}

average(nums: arrayOfNums)

let doubleNums = arrayOfNums.map { Double($0) }
let avg2 = average(nums: doubleNums)
let avg3 = average(nums: arrayOfNums, numberOfElements: arrayOfNums.count)


// part (b)

enum Animal {
    case dog, cat, mouse, horse, goat
}

func theSoundMadeBy(_ animal: Animal) -> String {
    switch animal {
    case .dog:
        return "The dog says woof!"
    case .cat:
        return "The cat says meow!"
    case .mouse:
        return "The mouse says squeek!"
    case .horse:
        return "The horse says ney!"
    case .goat:
        return "The goat says ehehehe!"
    }
}

theSoundMadeBy(.goat)
theSoundMadeBy(.mouse)

// part (c)

let nums = Array(0...100)
let numsWithNil = [79, nil, 80, nil, 90, 100, 72]
let numsBy2 = Array(2...100).filter { $0 % 2 == 0}
let numsBy4 = Array(2...100).filter { $0 % 4 == 0}

func evenNumbersArray(from nums: [Int]) -> [Int] {
    return nums.filter { $0 % 2 == 0 }
}

print(evenNumbersArray(from: nums))

func sumOfArray(from nums: [Int?]) -> Int {
    return nums.compactMap { $0 }.reduce(0, +)
}

print(sumOfArray(from: numsWithNil))

func commonElementsSet(from numsA: [Int], and numsB: [Int]) -> Set<Int> {
    return Set(numsA.filter { numsB.contains($0) })
}

print(commonElementsSet(from: numsBy2, and: numsBy4))


// part (d)
struct Square {
    let sideLength: Double
    var area: Double {
        pow(sideLength, 2)
    }
}

let square = Square(sideLength: 8.5)
print(square.area)


// Part 3 - Above and Beyond

protocol Shape {
    func calculateArea() -> Double
}

struct Circle: Shape {
    let radius: Double
    
    func calculateArea() -> Double {
        Double.pi * pow(radius, 2)
    }
}

struct Rectangle: Shape {
    let length: Double
    let width: Double
    
    func calculateArea() -> Double {
        length * width
    }
}

let circle = Circle(radius: 3.25)
print("Area of circle with radius \(circle.radius): \(circle.calculateArea())")

let rectangle = Rectangle(length: 3, width: 4.5)
print("Area of rectangle with length \(rectangle.length) and width \(rectangle.width): \(rectangle.calculateArea())")

extension Shape {
    func calculateVolume() -> Double {
        return 0.0
    }
}

struct Sphere: Shape {
    let radius: Double
    
    func calculateArea() -> Double {
        Double.pi * pow(radius, 2) * 4
    }
    
    func calculateVolume() -> Double {
        (Double.pi * pow(radius, 3) * 4) / 3
    }
}

let sphere = Sphere(radius: 5)
print("The area of the sphere is: \(sphere.calculateArea()). The volume of the sphere is: \(sphere.calculateVolume())")
