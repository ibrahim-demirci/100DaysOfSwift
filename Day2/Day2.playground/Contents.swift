import UIKit
import Foundation


/// 1.  Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]

/// 2. Sets
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red"])


/// 3. Tuples
var name = (first: "Taylor", last: "Swift")
name.1
name.first
name.first = "Taylor New"
// Error: name.first = 35


/// 3. Dictionaries
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]


/// 3.1 Default Values on Dictionaries
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Paul"]
favoriteIceCream["Charlotte", default: "Unknown"]


/// 4. Creating Empty Collections
var teams = [String: String]()
teams["Paul"] = "Red"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()


/// 5. Enumerations
enum Result {
    case success
    case failure
}
let result = Result.failure

/// 5.1 Enum Associated Values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "Football")

/// 5.2 Enum Raw Values

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)
