
import UIKit


// 用 let 来声明常量，用 var 来声明变量
// 常量和变量必须在使用前声明
// 常量&变量的使用原则：尽量先用 let，只有需要变的时候，再用 var，能够更加安全

let maxLoginAttempts = 10 //声明常量 :用户尝试登录的最大次数，常量的值一旦确定不可再次更改
var currentLoginAttempts = 0 //声明变量 :当前尝试登录次数

// 可以在一行中声明多个常量或者多个变量，用逗号隔开：
var x = 0.1, y = 0.2, z = 0.3

// 类型标注
var str = "Hello,World!"
var str1 : String = "Hello,Swift"  // 字符串类型
var num : Int = 2  // 整型
let boolVlaue = true // 布尔值


// 常量和变量的命名
// 可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符：
let π = 3.1415926
let 你好 = "你好世界"
let 😄😭 = "hello"

print("当前尝试登陆次数为 \(currentLoginAttempts) 次")

// Swift 并不强制要求你在每条语句的结尾处使用分号（;）
let cat = "🐈" ; print(cat)


// 整数范围
// UInt8 类型的常量或者变量能存储的数字范围是 0 ~ 255
// Int8 类型的常量或者变量可以存储的数字范围是 -128 ~ 127

let minValue = UInt8.min    // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max    // maxValue 为 255，是 UInt8 类型

// UInt8 类型不能存储负数，所以会报错
// let cannotBeNegative: UInt8 = -1
// Int8 类型不能存储超过最大值的数，所以会报错
// let tooBig: Int8 = Int8.max + 1


// Int

// 在32位平台上，Int 和 Int32 长度相同。 ( 32为Int可以存储的整数范围是 -2,147,483,648 ~ 2,147,483,647 )
// 在64位平台上，Int 和 Int64 长度相同。

// UInt: 特殊的无符号类型

// 在32位平台上，UInt 和 UInt32 长度相同。
// 在64位平台上，UInt 和 UInt64 长度相同。


// 浮点数
// Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型。 Double精确度很高，至少有15位数字
// Float表示32位浮点数。精度要求不高的话可以使用此类型。 Float只有6位数字


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


/* 元组
 
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

// 0.1可以在定义元组的时候给单个元素命名：
let http200Error = (statusCode2:200 , errorInfo:"params is error!")
print("web服务器返回的状态码是\(http200Error.statusCode2), 描述为：\(http200Error.errorInfo)")













