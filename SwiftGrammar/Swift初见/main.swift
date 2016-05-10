//
//  main.swift
//  Swift初见
//
//  Created by wushangkun on 16/5/10.
//  Copyright © 2016年 wushangkun. All rights reserved.
//

import Foundation

// ---------------------- 简单值（Simple Values）----------------

// 1.使用let来声明常量，使用var来声明变量。
var myVariable = 42
myVariable = 50
let myConstant = 42


// 2.不用明确地声明类型，声明的同时赋值的话，编译器会自动推断类型
// 3.如果初始值没有提供足够的信息（或者没有初始值），那你需要在变量后面声明类型，用冒号分割。
let value1 : Double = 70
print(value1)   // 70.0


// 4.值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换。
let label = "The width is "
let width = 94
let total1 = label + String(width)
let total2 = label + "\(width+1)"
print("\(total1) , \(total2)")    // The width is 94 , The width is 95


// 5.使用方括号[]来创建数组和字典，并使用下标或者键（key）来访问元素。最后一个元素后面允许有个逗号。
var shoppingList = ["apple","orange","banana"]
print(shoppingList[0])

var jsonDict = [
    "errorCode" : "0",
    "errorMessage" : "网络不给力",
]
print(jsonDict["errorMessage"])


// 5.1要创建一个空数组或者字典，使用初始化语法。
let emptyArray = [String]()
let emptyDict = [String : Float]()


// 5.2如果类型信息可以被推断出来，你可以用[]和[:]来创建空数组和空字典
shoppingList = []
jsonDict = [:]



// ----------------------控制流（Control Flow）----------------

// 1.在if语句中，条件必须是一个布尔表达式, 没有非假即真的概念
let scores = [75, 56, 98, 67, 55]
var passNum = 0
for score in scores{

    if score >= 60{
        passNum += 1;
    }
}
print("及格人数为:\(passNum)")


// 2.可以一起使用if和let来处理值缺失的情况。这些值可由可选值来代表
//   在类型后面加一个问号来标记这个变量的值是可选的
var optionalString : String? = "wushangkun"
print(optionalString == nil)  //false

var greeting = "Hello!"
if let name = optionalString{
    greeting = "Good morning, \(name)"
}
print(greeting)     //Good morning, wushangkun


// 2.1 另一种处理可选值的方法是通过使用 ?? 操作符来提供一个默认值。如果可选值缺失的话，可以使用默认值来代替。
let nickName : String? = nil
let fullName : String  = "wushangkun"
let greetName = "Hi! \(nickName ?? fullName)"
print(greetName)  //Hi! wushangkun


// 3.switch支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("celery")
case "cucumber", "watercress":
    print("watercress")
    
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")   //Is it a spicy red pepper?
    print(x)   //red pepper
    
default:
    print("Everything tastes good in soup.")
    // 不需要在每个子句结尾写break
}


// 4.使用for-in来遍历字典，需要两个变量来表示每个键值对
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for(k,v) in interestingNumbers {
    for num in v {
        if num > largest {
        largest = num
        }
    }
}
// 字典是一个无序的集合，所以他们的键和值以任意顺序迭代结束。
print("largetNum = \(largest)") //largetNum = 25


// 5. forin 使用..<创建的范围不包含上界，如果想包含的话需要使用...
var total = 0
for i in 0..<5 {
    print(i) // 0 1 2 3 4
}
for i in 0...5 {
    print(i) // 0 1 2 3 4 5
}

// while - do
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

// do - while
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)



// ----------------------函数和闭包（Functions and Closures）----------------

// 1.使用func来声明一个函数 , 使用func来声明一个函数
func loginAct(userName:String , passWord:String) -> (Bool){

    if passWord.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) >= 6 {
        return true
    }else{
        return false
    }
}
// 调用loginAct方法
loginAct("wushangkun", passWord: "123456")


// 2.函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式
func sumof(numArray:Int...) -> Int {
    var sum = 0
    for num in numArray {
        sum += num
    }
    print("sum = \(sum)") //sum = 15
    return sum
}
sumof(2,3,4,6)


// 3.函数可以嵌套
// 被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数
func returnFifteen() -> Int {
    var  y = 10
    func add(){
        //被嵌套的函数可以访问外侧函数的变量y，
        y += 5
    }
    add()
    return y
}
returnFifteen()


// 4.函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> (Int -> Int) {
    func addOne(num:Int) -> Int {
         return num + 1
    }
    //addOne函数 作为 makeIncrementer函数 的返回值。
    return addOne
}
var increment = makeIncrementer()
print("increment(5) = \(increment(5))") //increment(5) = 6


// 5.函数也可以当做参数传入另一个函数
func hasSmallNum(numArray:[Int] , condition: Int -> Bool) -> Bool {
    for num in numArray {
        if condition(num) {
            return true
        }
    }
    return false
}

func lessThanTen(num: Int) -> Bool {
    return num < 10
}

var numbers = [12, 8, 3, 45, 23]
//lessThanTen函数 当做 参数 传入 hasSmallNum函数 ！！！
hasSmallNum(numbers, condition: lessThanTen)




let mappedNumbers = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(mappedNumbers) // [36, 24, 9, 135, 69]





















// ----------------------对象和类（Objects and Classes）----------------
// ----------------------枚举和结构体（Enumerations and Structures）----------------
// ----------------------协议和扩展（Protocols and Extensions）----------------
// ----------------------错误处理（Error Handling）----------------
// ----------------------泛型（Generics）----------------
