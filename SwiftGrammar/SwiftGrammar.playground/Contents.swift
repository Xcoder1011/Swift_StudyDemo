//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*
输出
OC:     NSLog(@"Hello, World!");
Swift:  print("Hello, World!")
*/
print("Hello, World!")

// 常量&变量的使用原则：尽量先用 let，只有需要变的时候，再用 var，能够更加安全
// 定义变量
var i = 10

print(i)

i = 15

print(i)

// 定义常量
let j = 20
// 常量一经定义不能自改数值
//j = 25
print(j)



// 常量&变量的使用原则：尽量先用 let，只有需要变的时候，再用 var，能够更加安全

/******************************************************/

// 变量类型
let num = 10
print(num)
// 自动类型推导  NSArray *arr = [NSMutalbeArray array];
let value = 10.10
print(value)

// 指定类型
let dValue: Double = 10.1
print(dValue)

print(Double(num) + dValue)
print(num + Int(value))



/*
在Swift中值"永远不会"被隐式转换为其他类型, 必须显示转换
Swift中整数默认是Int64  == long
Swift中小数默认是Double
*/
let sum = Double(num) + value
print(sum)

let size = CGSize(width: 10, height: 10)
// Double和CGFloat也需要转换
let res = size.width + CGFloat(dValue)


/******************************************************/

/*
创建对象
OC:     alloc initWithXXX 方法
Swift:  (xxx:)

调用方法
OC:     [UIColor redColor];
Swift   UIColor.redColor()

枚举
OC:      UIButtonTypeContactAdd
Swift:   UIButtonType.ContactAdd
*/


// 使用 let 修饰 v 并且赋值，表示 该常量的内存地址不允许修改，但是可以修改其内部的属性
let view = UIView(frame: CGRectMake(0, 0, 100, 100))
view.backgroundColor = UIColor.redColor()

let btn = UIButton(type: UIButtonType.ContactAdd)
btn.center = CGPoint(x: 50, y: 50)
view.addSubview(btn)


/******************************************************/

/*
1.条件不需要加圆括号
2.{}不能省略
*/
var ifnum = 10

if ifnum > 0 {
    
    print("i 是大于0的")
}


let intValue = 10
if intValue > 5{
    print("OK")
}

/*
1.Swift中没有C和OC中非零即真的概念
2.Swfit中逻辑值只有两个true/false
*/

//if intValue { //错误的
//print(intValue)
//}

if intValue == 10 {
    print(intValue)
}

/*
三目运算符和OC中的一样
提示: Swift中三目运算符用得很多
*/

let errorCode  = intValue > 9 ? 1 : 0
print(errorCode)

let result = intValue > 20 ? 20 : 10
print(result)

/******************************************************/

/*
可选类型(Optional) ?
>表示变量可以有值, 也可以没有值

>不是所有的对象实例化方法都会返回值,比如
>convenience init? 构造函数, ?表示不一定能够实例化出对象
> 这种函数返回的对象，被称为 可选项，即有可能有值，也有可能没有值


>实际开发时，需要针对这种对象加以判断，并且在分支内部使用 !，指明该对象确实是存在的
>!表示告诉编译器一定有值, 编译能够通过, 如果运行时没有值就会直接崩溃
>提示: ? 和 ! 是所有刚刚接触Swift的OC程序员最蛋疼的问题, 前期开发要注意多看文档和利用编译器提示解决
*/


let url = NSURL(string: "http://www.baidu.com/")
let url2 = NSURL(string: "http://www.baidu.com/")

// 1. 需要考虑url是否有值
if url != nil{
    let request = NSURLRequest(URL: url!)
}

// 2. 不需要考虑url3是否有值, 能进入{}一定有值
if let url3 = NSURL(string: "http://www.baidu.com/"){
    let request = NSURLRequest(URL: url3)
}

// 总结:
// 1. 使用 if let 常量 = 可选构造函数 的方式能够确保分支内部常量是一定有值的 , 在分支内部不再需要使用! (重要使用技巧)




// 演练3
var name : String?
print(name?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))

name = "Xcoder"
print(name?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))

let constValue = 10
print(constValue + (name?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) ?? 0) )

// 总结:
// 1. ?? 是一个非常有用的操作符，能够快速对 nil 进行判断
// 2. 如果对象是nil,则使用 ?? 后面的值代替前面的nil值进行计算
// 3. 在使用 ?? 时候，需要用（）包起来

/******************************************************/



/* ----》 循环写法
OC传统写法:
>不需要()
>i没有类型, 使用的是var
*/

for var index = 0; index < 10; index++
{
    print(index)
}


for var i = 0; i < 10; i++
{
    print(i)
}


/*
Swift
> 0~9之间, 其中 0..< 中间不能有空格
> Swift1.0版本 0..10
*/

// 遍历 0 ~ 9
for i in 0..<10
{
    print(i)
}

print("-----------")

// 遍历 0 ~ 10
for i in 0...10
{
    print(i)
}


// 特殊写法: 不关心下标可以使用 _ 省略
// 在Swift中 _ 使用非常广泛
for _ in 0...20
{
    print("hello")
}


// while循环
var n = 0
while n < 10
{
    print(n)
    n++
}


// do while
var m = 0
repeat{
    print(m)
    m++
}while m < 10


/******************************************************/

// 定义数组
let array = ["computer", "apple"]
print(array)
print(array as NSArray) //像OC一样打印


// 遍历每一个元素
for obj in array{
    print(obj)
}

// 获取元素
array[0]
array[1]

// 1.数组中保存的都是字符串
let arr1 = ["name","age"]
// 2.数组中保存的是 NSObject
let arr2 = ["name",18]


// 添加元素
// 不能给 不可变数组 添加内容
//array.append("why")

// let不可变对象, var可变对象
var arrayM = ["apple", "orange"] // 可变数组
arrayM.append("banana")

// 在Swift开发中数组可以存放任意类型
var arrayM2 = ["name", "sex", 123]
arrayM2.append("456")

// 拼接数组
var arrayM3 = ["zs", "ls", "ww", "zl"]
arrayM += arrayM3     //相同类型可以合并

//只有相同类型的数组才可以拼接
//arrayM2 += arrayM3  //不相同类型的数组不能拼接

// 删除
arrayM3
arrayM3.removeAtIndex(0)  //去掉第index = 0个数据
arrayM3
arrayM3.removeFirst(2) //去掉前2个数据
arrayM3
// 删除所有
//arrayM3.removeAll()

// 删除并保留容量
arrayM3.removeAll(keepCapacity: true)
arrayM3.capacity  // 容量为 4
arrayM3.append("1")
arrayM3.capacity
arrayM3.append("2")
arrayM3.capacity
arrayM3.append("3")
arrayM3.capacity
arrayM3.append("4")
arrayM3.capacity
arrayM3.append("5")
// 超过容量, 容量会直接*2
arrayM3.capacity  // 容量为 4*2 = 8

// 初始化数组
var arrayM4: [String] //定义只能保存字符串类型数组
arrayM4 = [String]() //初始化
// 数组没有初始化之前不允许做任何操作
arrayM4.append("lnj")
print(arrayM4)

/*
总结:

如果定义数组时指定了保存对象的类型，则不能向数组中添加其他类型的内容
可以使用 [String]()
let 定义的数组是不可变的
var 定义的数组是可变的
*/


/******************************************************/
// 定义字典
// 1. 最常见的字典类型[String : NSObject], 例如JSON
var normalDict = [String: NSObject]()
// 2. 定义并实例化字典
var anyDict = [String :AnyObject]()
anyDict["name"] = "感冒灵"
anyDict["goodId"] = 226
anyDict["price"] = "12.0"

// 3.不常见写法
var Dict : [String :NSObject]
Dict = [String :NSObject]()
Dict["name"] = "swift学习"


// 4. 常见写法
var dict = ["name":"感冒灵", "goodId": 226]

// 遍历字典
// k,v 可以随便写, 前面是key后面是value
for (k, v) in dict{
    print(k)
    print(v)
}

// 获取元素
dict["name"]

// 添加元素
// 如果key不存在会新增
dict["price"] = "12.0"
dict

// 替换元素
// 如果key存在会替换
dict["name"] = "盖中盖"

// 删除元素
dict.removeValueForKey("name")
dict

// 合并字典 1
var dict2 = ["score": 123]
for (k, v) in dict2{
    dict[k] = v
}
dict


// 初始化
var dict3: [String: NSObject]
dict3 = [String: NSObject]()
dict3["date"] = "20160310"
dict3

// 合并字典 2
for (k,v) in dict3
{
    dict.updateValue(v, forKey: k)
}
print(dict)


/******************************************************/

/*
Swift中使用String是一个结构体,  效率更高, 支持直接遍历
OC中的NSString是一个对象,性能略差
Swift中的String和OC中的NSString可以很方便的进行转换
*/

//遍历字符串
let string1 = "I am a iOS developer"
for s in string1.characters
{
    print(s)
}


var str1 = "遍历字符串测试"
for c in str1.characters
{
    print(c)
}


// 字符串拼接
var str2 = "cool"
str2 += str

let age = 30
let name1 = "lnj"
// 直接在 "" 中使用 \(变量名) 的方式可以快速拼接字符串
let str3 = "name = \(name1), age = \(age)"
let totalStr = String (format: "%2d:%2d:%2d", arguments: [1,24,26])
let frmStr = String(format: "%02d:%02d:%02d", arguments: [9, 23, 8])


// 字符串截取, 建议使用NSString
let str4 = "xmgcool"
let nsString1 :NSString = str4
let subString1 = nsString1.substringWithRange(NSMakeRange(0, 3)) //推荐写法

let nsString2 = str4 as NSString
let subString2 = nsString2.substringFromIndex(3)

// String & Range 的结合
let testStr = "I am a iOS developer"
var subStr = testStr.substringWithRange(Range<String.Index>(start: testStr.startIndex, end: testStr.endIndex)) //复杂写法
print(subStr)


// 格式化字符串
for _ in 0...10
{
    var index = 1
    let str = String (format: "商品的ID为:%04d", arguments: [index])
    index++
    // 如果需要指定字符串格式，可以使用 String(format:...) 的方式
}




/******************************************************/
 
 /*
 格式:
 func 函数名称(参数列表) -> 返回值
 语义: 将前面的计算结果, 输出给后面的返回值
 
 // 函数定义格式：func 函数名(参数: 参数类型...) -> 返回值
 { // 代码实现 }
 
 */
 
 // 没有参数没有返回值
 /*
 1. 可以写为 ->Void
 2. 可以写为 ->()
 3. 可以省略
 */
 
 // 可以写为 ->Void
func loginAct() ->Void{
    print("没有参数,没有返回值")
}
loginAct()

// 可以省略
func loginAct1() {
    print("没有参数,没有返回值1")
}
loginAct1()

// 可以写为 ->()
func loginAct2() ->(){
    print("没有参数,没有返回值2")
}
loginAct2()

// 带两个参数
func loginAct4(name:String , age:Int) -> Bool{
    if name.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0
    {
        print("两个参数,name.length = \(name.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))")
        return true
    }
    print("两个参数,返回值为 false")
    return false
}

// 默认情况下，在调用函数时，第一个参数名是省略的
loginAct4("wushangkun", age: 18)


// 有参数没有返回值
func sum1(a:Int , b:Int) {
    print("a + b = \(a+b)")
}
sum1(2, b: 3)


// 有参数有返回值
func sum2(a:Int , b:Int) -> Int{
    return(a+b)
}
sum2(3, b: 4)


// 可以省略参数名
func sum3(a:Int , _ b:Int , _ c:Int){
    print("a+b+c = \(a+b+c)")
}
sum3(3, 4, 5) //可以省略参数名


// 强制要求参数名
func sum4(x a:Int , y b:Int) -> Int {
    return a+b
}
//  xy外部参数, ab内部参数
sum4(x: 10, y: 20)


// 没有参数有返回值
func getNum() -> Int{
    return 998
}
print(getNum())

