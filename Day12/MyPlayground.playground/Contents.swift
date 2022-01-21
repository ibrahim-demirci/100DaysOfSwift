import UIKit


/// Handling Missing Data
var age: Int? = nil
age = 38


///  Unwrapping Optionals
var name: String? = nil
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


/// Unwrapping with Guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
greet(nil)


/// Force Unwrapping
let str = "5"
let num = Int(str)!


/// Implicitly Unwrapped Optionals
let age: Int! = nil



