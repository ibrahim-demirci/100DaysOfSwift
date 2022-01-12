import UIKit


/// Wr'iting Throwing Functions
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

/// Running Throwing Functions
do {
    try checkPassword("password")
    print("That password is good")
} catch {
    print("You can't use this password.")
}
