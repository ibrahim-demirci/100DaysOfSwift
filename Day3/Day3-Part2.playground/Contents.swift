import UIKit


/// Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces A lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

/// Combining Operators

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}
