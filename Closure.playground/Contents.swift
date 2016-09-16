//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


typealias IntegerFunction = Int -> ()

func  gamCounterSample() -> Int -> Void {
    func increment(i: Int){
        print("Integer passed in: \(i)")
    }
    return increment
}


func  gameCounter() -> IntegerFunction {
    var counter = 0
    
    func increment(i : Int){
        counter += i
        print("Counter value \(counter)")
    }
    
    return increment
}

let aCounter = gameCounter()
aCounter
aCounter(1)
aCounter(100)

let anotherCounter = gameCounter()
anotherCounter
anotherCounter(1)
anotherCounter(0)


func applyMutliplication(value: Int, multFunction: Int -> Int) -> Int {
    return multFunction(value)
}
applyMutliplication(2, multFunction: {value in
    value * 3})

/**************************************/

func doubler(i: Int) -> Int{
    return i * 2
}

let doubleFunction = doubler

let numbers = [1,2,3,4,5]
let doubledNumber = numbers.map { doubleFunction in
    print()
}

let theOtherNumber = numbers.map(doubleFunction)

/**********Closure**********************/

//Rule 1: {(parameter) -> type in statment}
let tripledNumbers = numbers.map({(i: Int) -> Int in return i * 3})

//Rule 2: if closure is a parameter, the closre can imferring type from context
let anotherTripledNumber = numbers.map({i in return i * 3})

//Rule 3: Implicit returns from single-expression closures  如果只有一行return可以省略
let anotherAnotherTripledNumber = numbers.map({i in  i * 3})

//Rule 4: Shorthand Argument Names $0 is the first parameter $1 is the second parameter
let anotherAnotherAnotherTripledNumber = numbers.map({$0 * 3})

//Rule 5: Trailing closures
let anotherAnotherAnotherAnotherTripledNumber = numbers.map(){$0 * 3}

/**************************************/

numbers.map(){
    (digit: Int) -> Int in
    if digit % 2 == 0 {
        return digit/2
    }else{
        return digit
    }
}
/**************************************/


//Rule 6: Ignoring parenthese
numbers.map{ $0 * 3 }






