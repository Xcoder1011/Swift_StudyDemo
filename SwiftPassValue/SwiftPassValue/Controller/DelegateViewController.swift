//
//  DelegateViewController.swift
//  SwiftPassValue
//
//  Created by KUN on 2018/12/16.
//  Copyright © 2018年 wushangkun. All rights reserved.
//

import UIKit

class DelegateViewController: BaseReceiveResultController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func testBtnClicked(_ btn: UIButton) {
        
        let controller = PassValueViewController.init()
        controller.title = self.title
        controller.delegate = self; // 设置代理
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// 遵守 PassValueViewControllerDelegate 代理

extension DelegateViewController: PassValueViewControllerDelegate {
    
    func passValueDelegateMethod(inputStr: String) {
        
        self.textView.text = "传过来的参数为：\(inputStr)"
    }
}
