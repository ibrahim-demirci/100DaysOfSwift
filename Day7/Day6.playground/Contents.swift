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



