import UIKit

/// Creating Basic Closures
let driving = {
    print("I'm driving in my car")
}
driving()


/// Accepting Parameters
let drivingParameter = { (place: String) in
    print("I'm goint to \(place) in my car")
}
drivingParameter("London")


/// Returning Values
let drivingWithReturn = { (place: String) -> String in
    return "I'm goint to \(place) in my car"
}
let message = drivingWithReturn("Berlin")


/// Closures As Parameters
func travel(action: () -> Void) {
    print("I'm ready to go")
    action()
    print("I arrived!")
}
travel(action: driving)
