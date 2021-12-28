import UIKit


/// Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]

/// Sets
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red"])


/// Tuples
var name = (first: "Taylor", last: "Swift")
name.1
name.first
name.first = "Taylor New"
// Error: name.first = 35
