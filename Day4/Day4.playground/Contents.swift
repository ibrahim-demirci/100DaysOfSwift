import UIKit

/// For Loop
let count = 1...10
for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

for _ in 1...5 {
    print("Play")
}

/// While Loop
var num = 1

while num <= 20 {
    print(num)
    num += 1
}
print("Ready or not, here I came!")
