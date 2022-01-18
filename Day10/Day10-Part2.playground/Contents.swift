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
