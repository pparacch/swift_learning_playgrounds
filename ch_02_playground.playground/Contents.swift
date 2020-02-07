import UIKit

var str = "Hello, playground"


// Idea behind this first playground is to:
// - experience some basic Swift programming
// - and learn the basic of Swift

// Constants & Variables
// names must be meaningful
// var, used for variables
// let, used for constant

let constant_1 = 10
var x = 10
var y = x + constant_1


let constant_2 = 20
var number = 10
var result = number + constant_2
// constant_2 = 15
//error cause it is not possible to change the value of a constant (once initialized
number = 15
result = number + constant_2
// var result = 23
//error when redeclaring a variable previously defined (same for constant)

// Uderstanding Type Inference
// Each variable/ constant in Swift has a type (Int, Double, String, Bool)
// Type Inference -> the engine determines the type based on the value used for initialization
// omit the type when declaring a variable or constant, the compiler will deduce the type from
// default value (use option to view the type of a variable

// the following code snippets are equivalent

// let constant = 10
// var number_1 = 10
// var result_1 = number_1 + constant

let constant: Int = 10
var number_1: Int = 10
var result_1: Int = number_1 + constant

// Other types
var an_integer: Int = 10
var a_float: Double = 10.555
var a_string: String = "some test"
var a_bool: Bool = true

// Working with text
// String type is used to store textual data

// declare a text variable (Type Inference) or explicitly
var a_text = "This is a text"
var another_text: String = "This is another text"

// Manipulation of text data
// concatenation
var greeting = "Hello "
var name = "Pedro"

var message = greeting + name

// ad-hoc functions can be used to manipulate a string
// Swift uses the dot syntax to access built-in methods and properties of a variable
message.uppercased()
message.lowercased()
message.count

// another example using text data and numbers
var bookPrice = 39
var numOfCopies  = 5
var totalPrice = bookPrice * numOfCopies
var totalPriceMessage = "The price of the books is $" + String(totalPrice)
// Another possibility is to use String Interpolation (recommended way to build a string from multiple types
var totalPriceMessageA = "The price of the books is $\(totalPrice)"

// Control Flow 101

var timeYouWakeup: Int = 6

// IF THEN ELSE
if (timeYouWakeup == 6){
    print("Cook yourself a big breakfast!")
} else {
    print("Go out for breakfast!")
}

// SWITCH
switch(timeYouWakeup){
case 6:
    print("Cook yourself a big breakfast!")
default:
    print("Go out for breakfast!")
}

var bonus = 11000

if bonus >= 10000 {
    print("I will travel to Paris & London!")
} else if bonus >= 5000 {
    print("I will travel to Tokyo!")
} else if bonus >= 1000 {
    print("I will travel to Bangkok!")
} else {
  print("Just stay home!")
}

switch bonus {
// case <lower_bound>...<upper_bound>:
case 10000...:
    print("I will travel to Paris & London!")
case 5000...9999:
    print("I will travel to Tokyo!")
case 1000...4999:
    print("I will travel to Bangkok!")
default:
    print("Just stay home!")
}


// Understanding Arrays &  Dictionaries

// Array example
// Ordered and mutable

// Create an arrays of strings
var bookCollection: [String] = ["Tool of Titans", "Rework", "Your Move"]
bookCollection[0]
bookCollection[0] = "Java"
bookCollection

var anotherCollection: [String]
anotherCollection = ["Book 1", "Book 2", "Book 3"]
anotherCollection.append("Book 4")

anotherCollection.count

// Array Iteration with an Index
for index in 0...(anotherCollection.count - 1) {
    print("\(index) - " + anotherCollection[index])
}

// Array Iteration - another way
for book in anotherCollection {
    print(book)
}

// Heterogeneus Array
var aLittleBitOfEverything: [Any] = [1, 1.2, "Book 1"]


// Dictionary 101
// not ordered, mutable and it can be homogeneus/ heterogeneus based on the type definition
// elements follow a key - value pattern

var bookCollectionDict: [String : String ] =
    ["1": "Book 1", "2": "Rework", "3": "Authority"]

// access elements of a dictionary
bookCollectionDict["2"]
bookCollectionDict["2"] = "Book 2"
bookCollectionDict

// Iteration over elements of a dictionary
for (key, value) in bookCollectionDict {
    print("ISBN: \(key)")
    print("Title: \(value)")
}


// Exercise
var emojiDict: [String : String] = [
    "👻": "Ghost",
    "💩": "Poop",
    "😠": "Angry",
    "😱": "Scream",
    "👽": "Alien"
]

var wordToLookup: String = "💩"
var wordMeaning = emojiDict[wordToLookup]
// wordMeaning is defined as an optional (by the compiler)
// this is because the dictionary may not have a value for the given key

print(wordMeaning)  // see warning

// to remove the warning (if statement and forced unwrapping
if wordMeaning != nil {
        print(wordMeaning!)
}


// Optionals 101
// Up till now, all the variables or constants we worked with have an initial value. This is a must in Swift. A non-optional variable guranteed to have a value. If you try to declare a variable without a value, you get an error.
// Technically, optional is just a type in Swift. This type indicates that the variable can have a value or no value. To declare a variable as an optional, you indicate it by appending a question mark ( ? )

var jobTitle: String? // variable is s String but also an optional (so it can have no value)
// a nil value is assigned to an optional variable with no value

// The compiler gives an error with the line below cause jobTitle is optional
// var newMessage = "Your job title is " + jobTitle

// This is how optionals can prevent you from writing bad code. Whenever you need to access an optional variable, Xcode forces you to perform verification to find out whether the optional has a value. So how can you perform such verification and unwrap the value of the optional variable? Swift offers a couple of ways to do that.

// first approach: if statement and forced unwrapping
if jobTitle != nil{
   // ! exclamation mark, used to access the value of the optional variable
   print("Your job title is " + jobTitle!)
} else {
   print("Your job title is missing!")
}

// second approach: optional binding
// use if let to find out if the variable has a value - if yes it is assigned to the temporary
// constant.
if let jobTitleWithValue = jobTitle {
   print("Your job title is " + jobTitleWithValue)
}else{
   print("Your job title is missing!")
}



// Extra: play with the UI
var emojiDict1: [String : String] = [
    "👻": "Ghost",
    "💩": "Poop",
    "😠": "Angry",
    "😱": "Scream",
    "👽": "Alien"
]

var wordToLookup1: String = "💩"
var wordMeaning1: String? = emojiDict1[wordToLookup1] // String Optional

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
containerView.backgroundColor = UIColor.orange

let emojiLable = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLable.text = wordToLookup1
emojiLable.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLable)

let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = wordMeaning1
meaningLabel.font = UIFont.systemFont(ofSize: 30.0)
meaningLabel.textColor = UIColor.white

containerView.addSubview(meaningLabel)
