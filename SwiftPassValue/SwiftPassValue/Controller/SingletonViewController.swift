//
//  SingletonViewController.swift
//  SwiftPassValue
//
//  Created by shangkun on 2019/1/16.
//  Copyright © 2019年 wushangkun. All rights reserved.
//

import UIKit

class SingletonViewController: BaseReceiveResultController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let inputStr = CacheBean.shareInstance.name {
            self.textView.text = "传过来的参数为：\(inputStr)"
        }
    }
    
    override func testBtnClicked(_ btn: UIButton) {
        let controller = PassValueViewController.init()
        controller.title = self.title
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
