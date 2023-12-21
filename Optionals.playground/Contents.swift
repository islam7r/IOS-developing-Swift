import UIKit


var myName : String?

myName?.uppercased()

//optionals : ? vs !

var myAge = "8o5"

var myInteger = (Int(myAge) ?? 0) * 5

// ?? gives u a chance that if ur value can't be Int ,then it will be automatically "0"

if let myNumber = Int(myAge) {
    print(myNumber * 5)
} else {
    print("Wrong Input! Try again")
}
