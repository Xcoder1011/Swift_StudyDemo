//
//  ViewController.swift
//  SwiftGrammar_Closure
//
//  Created by 吴尚昆 on 16/5/2.
//  Copyright © 2016年 wushangkun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Swift中定义属性, 必须在构造方法中初始化, 否则就必须加上?
    // 注意: 以下写法代表闭包的返回值可以为nil
    // var finished: ()->()?
    
    /* 属性block **/
    var finishedBlock:(() -> ())?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //方法调用
        
        startRequest()
        
        // 2.闭包的简单用法
        testClosure1 { () -> () in
            print("执行回调testClosure \(__LINE__)")
        }
        
        
        testClosure2("testName") { (name) -> () in
            print("执行回调testClosure1 \(__LINE__), 参数name = \(name)")
        }
        
        
        testClosure3 { (newAge, name) -> Bool in
            if newAge < 18 {
                print("\(name)年龄小于18,不允许登陆")
                return false
            } else{
                print("\(name)年龄不小于18,允许登陆")
                return true
            }
        }
        
        // 3.测试闭包的返回值
        let scroll = createScrollView({ () -> Int in
            return 5
            }) { (index) -> UILabel in
                let width = 200
                let label = UILabel()
                label.backgroundColor = UIColor.greenColor()
                label.textColor = UIColor.darkGrayColor()
                label.font = UIFont.systemFontOfSize(17)
                label.text = "createScrollView\(index)"
                label.frame = CGRect (x: index * width, y: 0, width: width, height: 60)
                return label
        }
        view.addSubview(scroll)
        
        
        // OC中 __weak typeof(self) weakSelf = self
        weak var weakSelf = self
        // 4.测试闭包的循环引用
        testRecycle { () -> () in
            print("测试闭包的循环引用")
            weakSelf?.view.backgroundColor = UIColor.orangeColor()
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
    
    func startRequest() {
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print(NSThread.currentThread())
            print("进行下载耗时操作......")
            
            dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
                print("回到主线程,更新UI")
            })
        }
    }
    
    func testClosure1(finishedBlock:() -> ()) {
        print("耗时操作...")
        // 1.调用block , 没有参数，没有返回值
        finishedBlock()
    }
    
    
    func testClosure2(name: String , finishedBlock:(name:String) -> ()) {
        print("testClosure2.name = \(name)")
        // 2.调用block , 1个参数，没有返回值
        finishedBlock(name: "wushangkun")
    }
    
    // 将 finishedBlock 作为参数
    func testClosure3( finishedBlock:(newAge:Int , name:String) -> Bool){
        // 3.调用block , 1个参数，没有返回值
        finishedBlock(newAge: 15 , name: "wushangkun")
    }
    
    /*
    闭包简写:
    1.如果没有参数, 没有返回值, in和in之前的东西可以省略
    2.如果闭包是函数的最后一个参数, 可以写在()后面  -- 尾随闭包
    3.如果只有一个闭包参数, 那么()也可以省略  -- 尾随闭包
    */

   
    
    
    // -------------------- 闭包的返回值 --------------------

    func createScrollView(labelCount:()->Int, labelWithIndex:(index:Int)-> UILabel) -> UIScrollView
    {
        //1.创建UIScrollView
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 64, width: self.view.frame.width, height: 60))
        let count = labelCount()
        
        // 2.遍历创建UILabel
        for i in 0..<count{
            let label = labelWithIndex(index: i)
            scroll.addSubview(label)
            scroll.contentSize = CGSize(width: CGFloat(count) * label.bounds.width, height: 60)
        }
        // 返回UIScrollView
        return scroll
    }
    
    
    
    // -------------------- 闭包的循环引用 --------------------
    
    func testRecycle(finishedBlock:() -> ()){
        print("耗时操作")
        //保存闭包
        self.finishedBlock = finishedBlock
        finishedBlock()
    }
    
    deinit
    {
       print("dealloc")
    }
    
    
    
    

}

