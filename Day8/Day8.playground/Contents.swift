import UIKit

/// Createing Your Own Structs
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn Tennis"


/// Computed Properties
struct SportComputed {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
    
}
let chessBoxing = SportComputed(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

