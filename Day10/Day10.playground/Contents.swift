import UIKit

/// Creating Your Own Classes
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")


/// Class Inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}


/// Overriding Methods
class Pinny: Dog {
    init(name: String) {
        super.init(name: name, breed: "Pinny")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
}
