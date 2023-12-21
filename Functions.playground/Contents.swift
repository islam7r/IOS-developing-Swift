import UIKit

func myFunction(){
    print("My Function")
}

myFunction()


// Input & Output & Return

func sumFunction(x: Int, y: Int) -> Int{
    return x + y
}

sumFunction(x: 5, y: 3)
sumFunction(x: 50, y: 13)



let myFunctionVariable = sumFunction(x: 5, y: 3)
print(myFunctionVariable)



func logicFunction(x: Int, y: Int) -> String{
    if(x <= y){
        return "Correct"
    }else{
        return "Incorrect"
    }
}
logicFunction(x: 30, y: 204)
