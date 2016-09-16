//: Playground - noun: a place where people can play

import UIKit


let value = [1,2,3,4,5]

var newArray = [Int]()
for number in value {
    newArray.append(number * 2)
}

//重建map 功能 ，进而了解带入closure的方法构造

extension Array {
    func map<T>(transform: Element  -> T) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(transform(x))
        }
        return result
    }
    
/*********** Flatmap ***********/
    func flatMap<T>(transform: Element -> [T]) -> [T]{
        var result = [T]()
        for x in self{
            result.appendContentsOf(transform(x))
        }
        return result
    }
}


let integerValues = ["1", "2", "3", "4"].map({Int($0)})


struct Account {
    let username: String
    let billingAddress: String?
}


let allUsers = [
    Account(username: "pasanpr", billingAddress: nil),
    Account(username: "benjakuben", billingAddress: "1234 Imaginary Street"),
    Account(username: "instantNadel", billingAddress: "5678 Doesn't Live Here Dr."),
    Account(username: "sketchings", billingAddress: nil),
    Account(username: "paradoxed", billingAddress: "1122 Nope Lane")
]


let validAddress = allUsers.flatMap({$0.billingAddress})
validAddress




