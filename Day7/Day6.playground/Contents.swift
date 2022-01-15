import UIKit

/// Using Closures As Parameters When They Accept Parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived")
}
travel { (place: String) in
    print("I'm going to \(place) in my car")
}


/// Using Closures As Parameters When They Return Values
func travelWithReturn(action: (String) -> String) {
    print("I'm getting ready to go.")
    let describtion = action("London")
    print(describtion)
    print("I arrived")
}
travelWithReturn{ (place: String) in
    return "I'm going to \(place) in my car"
}


/// Shorthand Paraneter Names
travelWithReturn {
    "I'm going to \($0) in my car"
}
