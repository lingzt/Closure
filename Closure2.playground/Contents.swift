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
}


let integerValues = ["1", "2", "3", "4"].map({Int($0)})

