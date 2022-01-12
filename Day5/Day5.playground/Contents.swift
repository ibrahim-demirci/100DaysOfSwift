import UIKit
import Darwin

var greeting = "Hello, playground"

/// Writing Functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}
printHelp()


/// Accepting Parameters
func square(number: Int) {
    print(number * number)
}
square(number: 5)


/// Returnin Values
func squareReturn(number: Int) -> Int {
    return number * number
}
let resultSquare = squareReturn(number: 3)
print(resultSquare)


/// Parameter Labels
func sayHello(to name: String) {
    print("Hello \(name)")
}
sayHello(to: "George")


/// Omitting Function Parameters
func greet(_ person: String) {
    print("Hello \(person)")
}
greet("Json")


/// Default Parameters
func greetWithDefault(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Hello \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
    
}

greetWithDefault("Taylor")
greetWithDefault("Taylor", nicely: false)
