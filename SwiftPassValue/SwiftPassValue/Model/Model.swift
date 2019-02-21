//
//  Model.swift
//  SwiftPassValue
//
//  Created by KUN on 2018/12/16.
//  Copyright © 2018年 wushangkun. All rights reserved.
//

import UIKit

struct  MainItem{
    let className :String
    let title: String
}

class MainModel: NSObject {
    var className :String?
    var title: String?
}


class CacheBean {
    
    var name: String?
    var title: String?
    var number: Int = 0
    
    /// 单例
    static let shareInstance = CacheBean()
    private init() {}
}
