import UIKit

var greeting = "Hello, playground"


var array = [String]()
var array2 = [String]()
array.append("abc")
array.append("bca")

array2 = array

array2.remove(at: 0)
print(array)
print(array2)
