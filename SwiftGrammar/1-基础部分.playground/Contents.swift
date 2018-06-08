
import UIKit


// 用 let 来声明常量，用 var 来声明变量
// 常量和变量必须在使用前声明
// 常量&变量的使用原则：尽量先用 let，只有需要变的时候，再用 var，能够更加安全

let maxLoginAttempts = 10 //声明常量 :用户尝试登录的最大次数，常量的值一旦确定不可再次更改
var currentLoginAttempts = 0 //声明变量 :当前尝试登录次数

// 可以在一行中声明多个常量或者多个变量，用逗号隔开：
var x = 0.1, y = 0.2, z = 0.3

let (x1, y1) = (3, 4)  // 现在 x1 等于 3，y1 等于 4
print(x1,y1)

// 类型标注
var str = "Hello,World!"
var str1 : String = "Hello,Swift"  // 字符串类型
var num : Int = 2  // 整型
let boolVlaue = true // 布尔值

var red , green , blue : Double  // 可以在最后一个变量名之后添加类型标注

print("Hello,World!" + "Hello,Swift")  // String 的拼接
let c1 = 9 % 4       // 等于 1
let c2 = -9 % 4      // 等于 -1
let c3 = 9 % (-4)    // 等于 1     // a % b 和 a % -b 的结果是相同的

// 常量和变量的命名
// 可以用任何字符作为常量和变量名，包括 Unicode 字符：
let π = 3.1415926
let 你好 = "你好世界"
let 😄😭 = "hello"

print("当前尝试登陆次数为 \(currentLoginAttempts) 次")

let cat = "🐈" ; print(cat) // 在同一行内写多条独立的语句,必须要用分号


// 整数范围
// UInt8 类型的常量或者变量能存储的数字范围是 0 ~ 255
// Int8 类型的常量或者变量可以存储的数字范围是 -128 ~ 127

let minValue = UInt8.min    // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max    // maxValue 为 255，是 UInt8 类型

// let cannotBeNegative: UInt8 = -1
// UInt8 类型不能存储负数，所以会报错

// let tooBig: Int8 = Int8.max + 1
// Int8 类型不能存储超过最大值的数，所以会报错


// Int

// 在32位平台上，Int 和 Int32 长度相同。 ( 32为Int可以存储的整数范围是 -2,147,483,648 ~ 2,147,483,647 )
// 在64位平台上，Int 和 Int64 长度相同。

// UInt: 特殊的无符号类型

// 在32位平台上，UInt 和 UInt32 长度相同。
// 在64位平台上，UInt 和 UInt64 长度相同。


// 浮点数
// Double表示64位浮点数。适用于需要存储很大或者很高精度的浮点数。 Double精确度很高，至少有15位数字
// Float表示32位浮点数。适用于精度要求不高的浮点数。 Float只有6位数字


/* 数值型字面量
 
一个十进制数，没有前缀
一个二进制数，前缀是0b
一个八进制数，前缀是0o
一个十六进制数，前缀是0x
 */
let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17


/*
 
如果一个十进制数的指数为 exp，那这个数相当于基数和10^exp的乘积：
1.25e2 表示 1.25 × 10^2，等于 125.0。
1.25e-2 表示 1.25 × 10^-2，等于 0.0125。
 
 如果一个十六进制数的指数为exp，那这个数相当于基数和2^exp的乘积：
 0xFp2 表示 15 × 2^2，等于 60.0。
 0xFp-2 表示 15 × 2^-2，等于 3.75。
 
 */
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0


// 整数和浮点数的转换必须显式指定类型：
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi 等于 3.14159，所以被推测为 Double 类型


let integerPi = Int(pi)
// integerPi 等于 3，所以被推测为 Int 类型


// 类型别名 : 给现有类型定义另一个名字
typealias MyCustomInt = UInt16
let minNum1 = MyCustomInt.min



/* *******************   元组   *******************
 
 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
 */

// 0.定义元祖
let http404Error = (404, "Not Found")

// 1.将一个元组的内容分解（decompose）成单独的常量和变量
let (statusCode, statusMessage) = http404Error
print("web服务器返回的状态码是\(statusCode), 描述为：\(statusMessage)")

// 2.只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记：
let (statusCode1, _) = http404Error
print("web服务器返回的状态码是\(statusCode1)")

// 3.可以通过下标来访问元组中的单个元素，下标从零开始：
print("web服务器返回的状态码是\(http404Error.0), 描述为：\(http404Error.1)")

// 4.可以在定义元组的时候给单个元素命名：
let http200Error = (statusCode2:200 , errorInfo:"params is error!")
print("web服务器返回的状态码是\(http200Error.statusCode2), 描述为：\(http200Error.errorInfo)")

// 注意：
// 1.如果两个元组的元素相同，且长度相同的话，元组就可以被比较
// 2.比较元组大小会按照从左到右、逐值比较的方式，直到发现有两个值不等时停止
// 3.Int 和 String 类型的值可以比较
// 4.有布尔类型的元组不能被比较

/*
    (1, "zebra") < (2, "apple")   // true，因为 1 小于 2
    (3, "apple") < (3, "bird")    // true，因为 3 等于 3，但是 apple 小于 bird
    (4, "dog") == (4, "dog")      // true，因为 4 等于 4，dog 等于 dog
 
    ("blue", -1) < ("purple", 1)       // 正常，比较的结果为 true
    ("blue", false) < ("purple", true) // 错误，因为 < 不能比较布尔类型
 */



/* *******************   可选类型  *******************
 
 
 处理值可能缺失的情况。 可选类型表示两种可能： 有值 或者 没有值。
 */

// 1.给可选变量赋值为 nil 来表示它没有值：
var statusCode2 :Int? = 404
statusCode2 = nil

/*
 Swift 的 nil 和 Objective-C 中的 nil 并不一样。
 在 Objective-C 中，nil 是一个指向不存在对象的 指针。
 在 Swift 中，nil 不是指针! 它是一个确定的 值，用来表示值缺失。
 任何类型的可选状态都可以被设置为 nil，不只是对象类型。
 */

// 2.声明一个可选常量或者变量但是没有赋值，它们会自动被设置为 nil：
var surveyAnswer :String?

// 3.可选值的强制解析
let possibleNum = "23"
let convertedNum = Int(possibleNum)
print(convertedNum as Any)   //"Optional(4567)"

if convertedNum != nil {
    print("convertedNum has an integer value of \(convertedNum!)") //当确定可选类型确实包含值, 可以在可选的名字后面加一个感叹号（!）来获取值
}


// 4.可选绑定
if let num = convertedNum {
    
}

if let num = Int(possibleNum) {
    // 如果转换成功，num 常量可以在 if 语句的第一个分支中使用。
    print("convertedNum has an integer value of \(num)")
} else {
}

// 可以包含多个可选绑定 或 多个布尔条件 在一个 if 语句中，只要使用逗号分开就行

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出 "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// 输出 "4 < 42 < 100"



/* *******************  隐式解析可选类型  *******************
 
 把要用作可选的类型的后面的问号（String?）改成感叹号（String!）来声明一个隐式解析可选类型。
 */

let possibleString: String? = "an optional string"
let forcedString: String = possibleString!   // 需要感叹号来获取值

let assumedString: String! = "an implicitly unwrapped optional string"
let implicitString: String = assumedString   // 不需要感叹号

// 仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值
if assumedString != nil {
    print(assumedString)
}

// 也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值
if let definStr = assumedString {
    print(definStr)
}


/*  *******************  断言  *******************
 
 */

let age = -3
// assert(age >= 0, "年龄 不可能 为负数")

if age > 0 {
    
} else {
    // 使用 assertionFailure(_:file:line:) 函数来表明断言失败
    // assertionFailure("年龄 不可能 为负数")
}


// 强制执行先决条件
// precondition(age >= 0, "年龄 不可能 为负数")
// precondition(index > 0, "Index must be greater than zero.")  //检查是否下标越界



/*  ******************* 运算符  *******************
 *
 */

// 1.三元运算符   (问题 ? 答案 1 : 答案 2)

// 2.空合运算符  (a ?? b)

// a != nil ? a! : b
// 表达式 a 必须是 Optional 类型。

let defaultColorName = "red"
var userDefinedColorName: String?   //默认值为 nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName 的值为空，所以 colorNameToUse 的值为 "red"


let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count


// 2.闭区间运算符  (a...b)  :从 a 到 b（包括 a 和 b）的所有值的区间。

for index in 0...count-1 {
    print("第 \(i + 1) 个人叫 \(names[i])")
}

// 3.半开区间运算符  (a..<b)  :从 a 到 b（包括 a 但是不包括b）的所有值的区间。

for index in 0..<count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}

// 4.单侧区间

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}


let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
