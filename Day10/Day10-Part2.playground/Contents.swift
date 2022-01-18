import UIKit

/// Copying Objects
class Singer{
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Azer Bulbul"

print(singer.name)


/// Deinitiializers
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
}


/// Mutability
let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)
