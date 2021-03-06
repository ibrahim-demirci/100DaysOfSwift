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


/// Property Observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% completed")
        }
    }
    
}
var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 50
progress.amount = 80


/// Methods
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()


/// Mutating Methods
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()
