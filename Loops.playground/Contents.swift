import UIKit

var myNumber = 1
myNumber = myNumber + 1

myNumber += 1


//While loop

var number = 0

while number < 15{
    //print(number)
    number += 3
}

var characterAlive = true

while characterAlive == true{
    //print(characterAlive)
    characterAlive = false
}


// "==" is for checking if it is true or not
// "!" means not, for example "!=" mean not equal

5 == 5
3 != 8


//For loop

var myFruitArray = ["Banana", "Apple", "Orange"]

for fruit in myFruitArray{
    print(fruit)
}


var myNumbers = [10, 20, 30, 40, 50, 60]

for number in myNumbers{
    print(number/5)
}


for myNewInteger in 1 ... 100{
    print(myNewInteger)
}
