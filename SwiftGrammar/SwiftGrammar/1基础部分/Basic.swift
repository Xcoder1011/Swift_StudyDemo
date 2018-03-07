//
//  Basic.swift
//  SwiftGrammar
//
//  Created by KUN on 2018/3/7.
//  Copyright © 2018年 wushangkun. All rights reserved.
//

import Foundation

// 用 let 来声明常量，用 var 来声明变量
// 常量和变量必须在使用前声明
// 常量&变量的使用原则：尽量先用 let，只有需要变的时候，再用 var，能够更加安全

let maxLoginAttempts = 10 //声明常量 :用户尝试登录的最大次数
var currentLoginAttempts = 0 //声明变量 :当前尝试登录次数


// 可以在一行中声明多个常量或者多个变量，用逗号隔开：
var x = 0.1, y = 0.2, z = 0.3


// 类型标注
var str = "Hello,World!"
var str1 : String = "Hello,Swift"  // 字符串类型
var num : Int = 2  // 整型
// 常量和变量的命名
// 可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符：
let π = 3.1415926
let 你好 = "你好世界"
let 😄😭 = "hello"

