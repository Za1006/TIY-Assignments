//: Playground - noun: a place where people can play
//Optional Chaining - Alternative to Forced Unwrapping
class Person
{
    var guest: Guest?
}

class Guest
{
    var numberOfPlates = 1
}

let tom = Person()
let tableCount = tom.guest?.numberOfPlates
tom.guest = Guest()


if let tableCount = tom.guest?.numberOfPlates
{
    print("Tom's guest has \(tableCount) plate. ")
}
else
{
    print("No guests")
}
// to retrive number of plates if guests exsists,the answer will show as nil value. But when assign "Guest" instance to tom, value is no longer nil.
