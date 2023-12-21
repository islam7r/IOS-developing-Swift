 import UIKit

var myFavoriteMovies = ["Extraction 1", "Extraction2", 50, false] as [Any]
//as -> casting
//any -> any object


//index
myFavoriteMovies[0]
myFavoriteMovies[1]
myFavoriteMovies[2]
myFavoriteMovies[3]


var myNumberArray = [1,2,3,4,5,6,7,1,2,3]
myNumberArray.append(8)
myNumberArray.last


//Set

//Unordered collection, unique elements

var mySet : Set = [1,2,3,4,5,1,2]
var myStringSet : Set = ["a","b","c","a"]
myStringSet.first


var myInternetArray = [1,2,3,1,2,5,6,2,1]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)

var mySet1 : Set = [1,2,3,4]
var mySet2 : Set = [3,4,5,6]

var mySet3 = mySet1.union(mySet2)
print(mySet3)


//Dictionary
//Key-Value pairing

var myFavoriteCeo = ["Meta" : "Mark Zuckerberg", "Tesla" : "Elon Musk", "Amazon" : "Jeff Bezos"]
myFavoriteCeo["Meta"]
myFavoriteCeo["Tesla"]

//How to add new item to the "Dictionary"

myFavoriteCeo["Apple"] = "Steve Jobs"
print(myFavoriteCeo)
