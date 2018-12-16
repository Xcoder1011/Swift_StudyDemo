//: Playground - noun: a place where people can play

import UIKit

let singleStr = "Hello, playground"

// 有 换行符
let multiStr1 = """
    Hello,world!
    Hello,playground!
"""

// 没有 换行符
// 在行尾写一个反斜杠（\）作为续行符。
let multiStr2 = """
    Hello,world!\
    Hello,playground!\
    Hello,Xcoder!
"""

// 为了让一个多行字符串字面量开始和结束于换行符，请将换行写在第一行和最后一行，例如：
let multiStr3 = """

Hello,world!
Hello,playground!
Hello,Xcoder!

"""

/*
 转义字符 \0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
 Unicode 标量，写成 \u{n}(u 为小写)，其中 n 为任意一到八位十六进制数且可用的 Unicode 位
 Swift 的 String 类型是基于 Unicode 标量 建立的。
 Unicode 码位的范围是 U+0000 到 U+D7FF 或者 U+E000 到 U+10FFFF。
*/
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"             // $，Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥，Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖，Unicode 标量 U+1F496

// 在多行字符串字面量里直接使用双引号（"）而不必加上转义符（\）
// 要在多行字符串字面量中使用 """ 的话，就需要使用至少一个转义符（\）：
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""

//####################################################################################

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// 打印两行:
// one
// twothree


let goodStart = """
one
two

"""
print(goodStart + end)
// 打印三行:
// one
// two
// three


// ---------------------- 初始化字符串 ----------------

// 两个字符串均为空并等价。
var emptyString1 = ""       // 空字符串字面量
var emptyString2 = String() // 初始化方法

emptyString2 += "2kuntech"

if emptyString1.isEmpty {
    print("Nothing to see here")
    emptyString1 = "Hi "
}

if emptyString2.hasPrefix("2kun") {
    print("has 2kun")
}

if emptyString2.hasSuffix("tech") {
    print("has tech")
}


// ====> 字符串是值类型 (值拷贝)
// Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值。
for character in emptyString2 {
    print(character)
}

// 字符串可以通过传递一个值类型为 Character 的数组作为自变量来初始化：
let exclamMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

var welcom = emptyString1 + emptyString2
welcom.append(exclamMark)


// 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message 是 "3 times 2.5 is 7.5"


// ---------------------- 字符串索引 ------------------

var greeting = "wushangkun"
greeting[greeting.startIndex]
// w
greeting[greeting.index(before: greeting.endIndex)]
// n
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 3)
greeting[index]
// h

// greeting[greeting.endIndex] // 越界error


//使用 indices 属性会创建一个包含全部索引的范围（Range）
for index in greeting.indices {
    print("\(greeting[index]) ", terminator:"")
    // 打印输出 "w u s h a n g k u n"
}

greeting.insert("&", at: greeting.endIndex) //"wushangkun&"
greeting.insert(contentsOf: "PHP", at: greeting.endIndex) // "wushangkun&PHP"

let index1 = greeting.index(of: "&") ?? greeting.endIndex
let beginning = greeting[..<index1]  //"wushangkun"
print(beginning) // "wushangkun\n"

// 只有在短时间内需要操作字符串时，才会使用 SubString。当你需要长时间保存结果时，就把 SubString 转化为 String 的实例
// SubString 不适合长期存储 —— 因为它重用了原 String 的内存空间
let newString = String(beginning) // 把结果转化为 String 以便长期存储。



// ---------------------- 比较字符串 ----------------

// 如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等的，那就认为它们是相等的

// 1.即使可扩展的字形群集是有不同的 Unicode 标量构成的,只要它们有同样的语言意义和外观，就认为它们标准相等。

let eAcuteQuestion = "Hi \u{E9}"                   // "Hi é"
let combinedEAcuteQuestion = "Hi \u{65}\u{301}"    // "Hi é"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"


// 2.相反，英语中的 LATIN CAPITAL LETTER A(U+0041，或者 A)不等于俄语中的 CYRILLIC CAPITAL LETTER A(U+0410，或者 A)。两个字符看着是一样的，但却有不同的语言意义：

let latinCapitalLetterA: Character = "\u{41}"       // "A"
let cyrillicCapitalLetterA: Character = "\u{0410}"  // "A"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
// 打印 "These two characters are not equivalent"
