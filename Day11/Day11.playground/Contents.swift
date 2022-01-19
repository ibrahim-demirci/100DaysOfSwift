import UIKit

/// Protocols
protocol Identifiable {
    var id: String { get set}
}

struct User: Identifiable {
    var id: String
}
func displayId(thing: Identifiable) {
    print("My ID is " + thing.id)
}


/// Protocol Inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}
protocol Employee: Payable, NeedsTraining, HasVacation { }

