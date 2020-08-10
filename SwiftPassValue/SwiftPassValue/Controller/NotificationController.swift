//
//  NotificationController.swift
//  SwiftPassValue
//
//  Created by shangkun on 2019/1/16.
//  Copyright © 2019年 wushangkun. All rights reserved.
//

import UIKit

class NotificationController: BaseReceiveResultController {

    private weak var observe: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 1.通知监听
        NotificationCenter.default.addObserver(self, selector: #selector(valueChanged(notification:)), name: NSNotification.Name.PassValueViewControllerPassedValue, object: nil)
        
        /// 2.通知监听, 此种方式 可以少写#selector方法
        observe = NotificationCenter.default.addObserver(forName: NSNotification.Name.PassValueViewControllerPassedValue, object: nil, queue: nil) { (noti) in
          
            print(">>>>>>>>>>",Thread.current)
            print(">>>>>>>>>> notification.object = \(noti.object ?? "")")
        }
    }

    @objc fileprivate func valueChanged(notification: Notification) {
        guard let inputStr = notification.object else { return }
        guard inputStr is String else { return }
        self.textView.text = "传过来的参数为：\(inputStr)"
    }
    
    override func testBtnClicked(_ btn: UIButton) {
        let controller = PassValueViewController.init()
        controller.title = self.title
        self.navigationController?.pushViewController(controller, animated: true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.removeObserver(observe!)
    }
}
