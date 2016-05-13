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
        //被嵌套的函数可以访问外侧函数的变量y
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


// 6.函数实际上是一种特殊的闭包:它是一段能之后被调取的代码
let mappedNumbers = numbers.map({
    // 可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(mappedNumbers) // [36, 24, 9, 135, 69]


// 6.1 如果一个闭包的类型已知，比如作为一个回调函数,
// 可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。
let mapNumbers = numbers.map({num in num * 3})
print(mapNumbers)  //[36, 24, 9, 135, 69]


// 6.2 对数组里的元素从小到大排序
// 当一个闭包是传给函数的唯一参数，可以完全忽略括号
let sortedNumbers = numbers.sort{ $0 < $1}
print(sortedNumbers)



// ----------------------对象和类（Objects and Classes）----------------

// 1.使用class和类名来创建一个类
// 创建类的时候可以忽略父类
class People {
    var age :Int = 0 // 申明实例变量
    var name : String
    
    // 一个构造函数来初始化类实例。使用init来创建一个构造器
    init (name : String) {  //通过构造器属性赋值
      self.name = name
    }
    
    //如果你需要在删除对象之前进行一些清理工作，使用deinit创建一个析构函数。
    
    func readName() -> String {
        return "people Name : \(self.name)"
    }
}

// 2.要创建一个类的实例，在类名后面加上括号
var people = People(name : "")
people.age = 18
people.name = "wushangkun"
// 使用点语法来访问实例的属性和方法。
var name = people.readName()
print(name)  //people Name : wushangkun


// 3.子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割
class Student : People {

    var school : String
    var score : Double
    
    init(score: Double , school: String, name:String) {
        self.score = score
        self.school = school
        super.init(name: name)
    }
    
    func readSchool(school:String) -> String {
        return "student school: \(school)"
    }
    //子类如果要重写父类的方法的话，需要用override标记
    override func readName() -> String {
    return "student Name : \(self.name)"
    }
}

let testStu = Student(score: 9.0 , school: "FUDAN" , name: "zhangsan")
print( testStu.school )  //FUDAN
print( testStu.readSchool("QINGHUA") )  //student school: QINGHUA
print( testStu.readName() ) //student Name : zhangsan


// 4.函数除了储存简单的属性之外，属性可以有 getter 和 setter
// GoodStudent类的构造器执行了三步:
/*
 * 4.1 设置子类声明的属性值
 * 4.2 调用父类的构造器
 * 4.3 改变父类定义的属性值。其他的工作比如调用方法、getters和setters也可以在这个阶段完成。
 */
class GoodStudent : People {
    
    var  mathScore : Double
    var  physicScore : Double
    var  score : Double

    init(mathScore: Double, physicScore:Double, name: String ,score:Double) {
        self.mathScore = mathScore
        self.physicScore = physicScore
        self.score = score
        super.init(name: name)
    }
    // 属性: 平均成绩
    var averageScore : Double {
        get {
            return (mathScore + physicScore)/2
        }
        set {
            mathScore = newValue
            physicScore = newValue
        }
    }
}

let testGood = GoodStudent(mathScore: 96,physicScore: 97,name: "lisi" ,score: 88)
// get
print("\(testGood.name).averageScore is \(testGood.averageScore)") //lisi.averageScore is 96.5
// set
testGood.averageScore = 50
print("\(testGood.name).physicScore is \(testGood.physicScore)") //lisi.physicScore is 50.0



// 5.如果不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用 willSet 和 didSet
class WinnerStudent {
    
    var  stu : Student {
        willSet {
            stu.score = newValue.score
        }
    }
    
    var goodStu : GoodStudent {
        willSet {
            goodStu.score = newValue.score
        }
    }
    init(score: Double , school: String, name:String) {
        stu = Student(score: score, school: school, name: name)
        goodStu = GoodStudent(mathScore: score+1, physicScore: score-1, name: name, score: score)
    }
}

var winnerStudent = WinnerStudent(score: 100, school: "JIAODA", name: "wangwu")
// get
print("winnerStudent.stu.score is \(winnerStudent.stu.score)") //winnerStudent.stu.score is 100.0
print("winnerStudent.goodStu.score is \(winnerStudent.goodStu.score)") //winnerStudent.goodStu.score is 100.0

// set
winnerStudent.stu = Student(score: 99, school: "JIAODA1", name: "wangwu1")
print("winnerStudent.goodStu.score is \(winnerStudent.goodStu.score)") //winnerStudent.goodStu.score is 100.0


// 6.处理变量的可选值时，可以在操作（比如方法、属性和子脚本）之前加?
// 如果?之前的值是nil，?后面的东西都会被忽略，并且整个表达式返回nil
let badStu : Student? = Student(score: 59, school: "xueyuan", name: "badStu")
let  badScore = badStu?.score
print("badStu score is \(badScore)") //badStu score is Optional(59.0)



// ----------------------枚举和结构体（Enumerations and Structures）----------------

// 1.使用enum来创建一个枚举 , 枚举可以包含方法
enum Rank:Int {
    // 默认情况下，Swift 按照从 0 开始每次加 1 的方式为原始值进行赋值，
    // 不过也可以通过显式赋值进行改变
    case Ace = 1 // Ace被显式赋值为 1 , 并且剩下的原始值会按照顺序赋值
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "这是扑克牌里的A"
        case .Jack:
            return "这是扑克牌里的J"
        case .Queen:
            return "这是扑克牌里的Q"
        case .King:
            return "这是扑克牌里的K"
        default:
            return String(self.rawValue)
        }
    }
}
let A = Rank.Ace
let aceValue = A.rawValue  // 1
print("aceValue is \(aceValue)")  //aceValue is 1


// 2.使用rawValue属性来访问一个枚举成员的原始值
if let convertRank = Rank(rawValue: 13) {
    let threeteenDes = convertRank.simpleDescription()
    print(threeteenDes)  // 这是扑克牌里的K
    
    //枚举的成员值是实际值，并不是原始值的另一种表达方法
    let TwoDes = Rank.Two.simpleDescription()
    print(TwoDes)  // 2
}


// 3. 使用 struct 来创建一个 结构体
struct Card {
    var rank : Rank
    func simpleDescription() -> String {
        return "请出牌：\(rank.simpleDescription())"
    }
}
let sixCard = Card(rank: .Six)
print(sixCard.simpleDescription())  // 请出牌：6
/*
 * 结构体和类有很多相同的地方，比如方法和构造器
 * 它们之间最大的一个区别就是 结构体是传值 ，类是传引用
 */


// 4. 相同枚举成员的实例可以有不同的值
enum ServerResponse {
    case Result(String, String)
    case Failure(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Failure("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    print("serverResponse...\(serverResponse)") //serverResponse...Sunrise is at 6:00 am and sunset is at 8:09 pm.
    
case let .Failure(message):
    print("Failure...  \(message)")
}



// ----------------------协议和扩展（Protocols and Extensions）----------------

// 1.使用protocol来声明一个协议。
protocol ExampleProtcol {
    var userName : String { get }
    mutating func clickButtonAtIndex(index: Int)
}

// 2.类、枚举和结构体都可以实现协议
class ExampleClass : ExampleProtcol {
    var userName: String = "Xcoder"
    func clickButtonAtIndex(index: Int) {
        print("\(userName)点击了第\(index)个按钮")
    }
}

var classObj = ExampleClass()
// 触发代理方法
classObj.clickButtonAtIndex(3) //Xcoder点击了第3个按钮
print(classObj.userName)  //Xcoder


// 3.结构体实现协议
struct ExampleStruct : ExampleProtcol {
    var userName: String = "Xcoder1"
    // mutating关键字用来 标记 一个会修改结构体的方法
    // 类的声明不需要标记任何方法 , 因为类中的方法通常可以修改类属性（类的性质）
    mutating func clickButtonAtIndex(index: Int) {
        print("\(userName)点击了第\(index)个按钮")
    }
}

var structObj = ExampleStruct()
// 触发代理方法
structObj.clickButtonAtIndex(4) //Xcoder1点击了第4个按钮
print(structObj.userName)  //Xcoder1


// 4. 使用 extension 来为现有的类型添加功能，比如新的 方法 和 属性
protocol ExtensionProtocol {
    var stringLength : Int {get}
    mutating func caculateStringLength() -> Int
}

extension String : ExtensionProtocol {
    var stringLength : Int {
        return self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
    }
     func caculateStringLength() -> Int {
        return self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
    }
}

print("Hello中国".stringLength) //11
print("Hello".caculateStringLength()) //5


// ----------------------错误处理（Error Handling）----------------

// 1.采用 ErrorType协议 的类型来表示错误
enum PrintError: ErrorType {
    case OutOfPaper
    case NoPaper
    case OnFire
}

// 使用 throws 来表示一个可以抛出错误的函数
func sendPrinter(printerName:String) throws -> String {
    if printerName == "Out of Paper" {
        //使用throw来抛出一个错误
        throw PrintError.OutOfPaper
    }
    return "没匹配到错误"
}

// 2.错误处理
// 一种方式是使用 do-catch
do {
    // 使用try来标记可以抛出错误的代码
    let printResponse = try sendPrinter("Out of Paper")
    print(printResponse)    //OutOfPaper
} catch {
    //在catch代码块中，除非另外命名，否则错误会自动命名为error。
    print(error)
}

// 可以使用多个catch块来处理特定的错误
do {
    let printResponse = try sendPrinter("Out of Paper")
    print(printResponse)
} catch PrintError.OnFire {
    print("rest of the fire")
}catch let printError as PrintError {
    print("Print error: \(printError)") //Print error: OutOfPaper
}catch {
    print(error)
}





















// ----------------------泛型（Generics）----------------
