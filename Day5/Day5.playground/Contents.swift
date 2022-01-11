import UIKit

var greeting = "Hello, playground"


func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}

printHelp()


func square(number: Int) {
    print(number * number)
}
square(number: 5)

func squareReturn(number: Int) -> Int {
    return number * number
}
let resultSquare = squareReturn(number: 3)
print(resultSquare)
