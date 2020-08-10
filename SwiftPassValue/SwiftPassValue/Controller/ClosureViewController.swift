//
//  ClosureViewController.swift
//  SwiftPassValue
//
//  Created by shangkun on 2019/1/16.
//  Copyright © 2019年 wushangkun. All rights reserved.
//

import UIKit

class ClosureViewController: BaseReceiveResultController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func testBtnClicked(_ btn: UIButton) {
        
        let controller = PassValueViewController.init()
        controller.title = self.title
        
        /// [weak self] 弱引用
        controller.passValueBlock1 = {[weak self] (inputStr: String) -> () in

            self?.textView.text = "传过来的参数为：\(inputStr)"
        }
        
        controller.passValueBlock2 = {inputStr in
            
            self.textView.text = "传过来的参数为：\(inputStr)"
        }
        
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
