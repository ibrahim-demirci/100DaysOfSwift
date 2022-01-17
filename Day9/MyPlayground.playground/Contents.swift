import UIKit


/// Initializers
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User()
user.username = "twostraws"


/// Referring to the Current Instance
struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}


/// Lazy Properties
struct FamilyTree {
init() {
    print("Creating family tree!")
}
}
struct Member {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}
var ed = Member(name: "Ed")
ed.familyTree
