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
let age2: Int! = nil


/// Nil Coalescing
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
var user = username(for: 15) ?? "Anonymous"


/// Optional Chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()


/// Optional Try
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}
