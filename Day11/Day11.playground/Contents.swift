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

