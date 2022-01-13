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
