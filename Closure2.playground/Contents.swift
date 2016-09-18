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


/*********** Filter ***********/

let evenNumber = (0...20).filter({ $0 % 2 == 0})
evenNumber


//测试使用closure
evenNumber.filter { (element: Int) -> Bool in
    return element % 2 != 0
}

evenNumber

//重写 filter
extension Array {
    func filter(includeElement: Element -> Bool) -> [Element] {
        var result = [Element]()
        for x in self where includeElement(x){
            result.append(x)
        }
        return result
    }
}

let pUser = allUsers.filter{ $0.username.characters.first == "p"}


/*********** Reduce ***********/
let scores = [10, 12, 11, 10, 12, 9]
let totalScore = scores.reduce(0, combine: {total, score in total + score})
totalScore

extension Array {
    func reduce<T>(initial: T, combine: (T, Element) -> T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }
    
//    func reduce<T>(initial: T, deduct: (T, Element) -> T) -> T {
//        var result = initial
//        for x in self {
//            result = deduct(result, x)
//        }
//        return result
//    }
}
//
//
//scores.reduce(64) { (remain: Int, score: Int) -> Int in
//    return remain - score
//}


let dataSet = (1...100).filter { $0 % 3 == 0 && 0 % 7 == 0 }
let identifer = dataSet.reduce("", combine: { str, num in str + "\(num)"})
identifer







