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


/// Closures With Multiple Parameters
func travelWithSpeed(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let describtion = action("London", 60)
    print(describtion)
    print("I arrived")
}
travelWithSpeed {
    "I'm going to \($0) at \($1) miles an hour"
}


/// Returning Closures from Functions
func travelReturnClosure() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result = travelReturnClosure()
result("London")
let result2 = travelReturnClosure()("London")


/// Capturing Values
func travelCapture() -> (String) -> Void {
    var counter = 1
    return {
        
        print("\(counter). I'm going to \($0)")
        counter+=1
    }
}
let resultCapture = travelCapture()
resultCapture("London")
resultCapture("London")
resultCapture("London")
resultCapture("London")
resultCapture("London")



