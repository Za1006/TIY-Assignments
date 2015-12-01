import UIKit

//: Playground - noun: a place where people can play
//Optional Chaining - Alternative to Forced Unwrapping
// If the optional is nil, the property, method or subscript call returns nil.
class Person
{
    var guest: Guest?
}
// specify optional by placing question mark (?) after the optional value you wish to call a property, method or subscript. 
// (!) is to force the unwrapping of its value.

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





