//
//  ViewController.swift
//  SwiftGrammar_Closure
//
//  Created by 吴尚昆 on 16/5/2.
//  Copyright © 2016年 wushangkun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //方法调用
        
        startRequest()
        
        testClosure { () -> () in
            //
            print("执行回调testClosure \(__LINE__)")

        }
        
        testClosure1("wushangkun") { () -> () in
            //
            print("执行回调testClosure1 \(__LINE__)")

        }
    }
    
    
    // -------------------- 闭包的简单写法 --------------------
    /*
    闭包 类似于 block
    block是C语言的, 类似于匿名函数
    闭包是定义函数的, Swift中函数就是一种特殊的闭包
    闭包的使用和block一样, 用于保存一段代码, 用作回调, 用作执行耗时操作
    闭包格式
    {
    (参数) -> 返回值类型
    in
    执行语句
    }
    */
    
    func testClosure1(name: String , finishedBlock:() -> ())
    {
        print("name = \(name)")
        finishedBlock()
    }
    
    func testClosure(finishedBlock:() -> ()) {
    
        print("耗时操作...")
       // weak var weakSelf = self
       finishedBlock()
    }

    func startRequest() {
        
    dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
        print(NSThread.currentThread())
        print("进行下载耗时操作......")
        
        dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
            print("回到主线程,更新UI")
        })
        }
    }
    
    
    // -------------------- 闭包的返回值 --------------------

    func createScrollView(labelCount:()->Int, labelWithIndex:(index:Int)->Int) -> UIScrollView
    {
        //1.创建UIScrollView
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        let count = labelCount()
        
        // 2.遍历创建UILabel
        for i in 0..<count{
            /*
            let label = UILabel()
            label.backgroundColor = UIColor.greenColor()
            label.textColor = UIColor.darkGrayColor()
            label.font = UIFont.systemFontOfSize(17)
            label.text = "text\(i)"
            label.frame = CGRect(x: i * width, y: 0, width: width, height: 44)
            sc.addSubview(label)
            */
//            let label = labelWithIndex(index: i)
//            scroll.addSubview(label)
//            scroll.contentSize = CGSize(width: CGFloat(count) * label.bounds.width, height: 44)
        }
        
        // 返回UIScrollView
        return scroll
    }
}

