//: Playground - noun: a place where people can play

import UIKit


// Swift 的 Arrays、Sets 和 Dictionaries 类型被实现为泛型集合

// 数组（Arrays）是有序数据的集。(可以有重复数据)
// 集合（Sets）是无序无重复数据的集。
// 字典（Dictionaries）是无序的键值对的集。


// ----------------------数组----------------

// 创建一个空数组
var mArray = [Int]()
mArray.append(7)
print("count = \(mArray.count)")

// 创建一个带默认值的空数组
var threes = Array(repeatElement(0, count: 3))  // [0, 0, 0]

// 通过两个数组相加创建一个数组
var totalArray = mArray + threes;  // [7, 0, 0, 0]

var studdents1 :[String] = ["James","LiHua"]
var studdents2  = ["James","LiHua"]
if studdents1.isEmpty {
    print("studdents1.count == 0")
} else {
    print("studdents1.count > 0")
}
studdents1 += studdents1  // 直接在数组后面添加一个或多个拥有相同类型的数据项：
var firstItem = studdents1[0]
studdents1[1] = "David"
studdents1[2] = "Kobe"


// 利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的

print( "rorigin array is \(studdents1)")   // rorigin array is ["James", "David", "Kobe", "LiHua"]

studdents1[1...3] = ["YaoMing"]

print( "replaced array is \(studdents1)")   // replaced array is ["James", "YaoMing"]

studdents1.insert("Joe", at: 1)

print( "insert array is \(studdents1)")   // insert array is ["James", "Joe", "YaoMing"]


// ----------------------集合----------------

