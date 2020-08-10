//
//  PassValueViewController.swift
//  SwiftPassValue
//
//  Created by shangkun on 2019/1/16.
//  Copyright © 2019年 wushangkun. All rights reserved.
//

import UIKit

 @objc protocol PassValueViewControllerDelegate: NSObjectProtocol {
    
    @objc func passValueDelegateMethod(inputStr: String)
}

typealias PassValueBlock1 = (_ inputStr: String) -> ()
typealias PassValueBlock2 = (String) -> ()
typealias PassValueBlock3 = () -> ()

class PassValueViewController: UIViewController {
    
    weak var delegate: PassValueViewControllerDelegate?
    
    var passValueBlock1: PassValueBlock1?
    var passValueBlock2: PassValueBlock2?
    
    var passValueBlock3:(() -> ())?
    var passValueBlock4:((Int) -> (Int))?
    
    var passValueBlock5:((Int) -> (Void)) = { a in } // 带初始化方式
    var passValueBlock6:((Int) -> (Int)) = { a in // 带初始化方式
        return 0
    }

    //返回值是一个函数指针，入参为String 返回值也是String
    var passValueBlock7:((Int, Int) -> (String) -> String)?

    
    lazy var tf: UITextField = {
        let tf = UITextField.init(frame: .zero)
        tf.placeholder = "请输入..."
        tf.layer.borderColor = UIColor(hex: "EE9AE5").cgColor
        tf.layer.borderWidth = 0.5
        tf.layer.cornerRadius = 4;
        tf.clearButtonMode = .whileEditing
        tf.returnKeyType = .done
        tf.keyboardAppearance = .alert
        tf.font = UIFont.boldSystemFont(ofSize: 15)
        tf.delegate = self
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createUI()
    }
    
    func createUI() {
        
        view.addSubview(tf)
        tf.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(tf.superview!).offset(150)
            make.width.equalToSuperview().multipliedBy(3.0/4)
            make.height.equalTo(44)
        }
        
        let btn = UIButton.init(type: .system)
        btn.setTitle("TEST", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.clear
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        btn.addTarget(self, action: .testBtnMethod, for: .touchUpInside)
        view.addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-60)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = btn.bounds
        gradientLayer.colors = [UIColor(hex: "5961F9").cgColor, UIColor(hex: "EE9AE5").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.locations = [0,1]
        btn.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    deinit {
        print("\(NSStringFromClass(self.classForCoder)) dealloc")
    }
    
    @objc func testBtnClicked( _ btn:UIButton) {
        
        guard let text = self.tf.text, text.count > 0 else {
            print("show message: 没有输入任何内容")
            return
        }
        
        /****************************** 代理传值  ************************************/
        
        if let delegate = delegate {
            if delegate.responds(to: #selector(PassValueViewControllerDelegate.passValueDelegateMethod(inputStr:))) {
                delegate.passValueDelegateMethod(inputStr: text)
            }
        }
        
        /****************************** 闭包传值  ************************************/

        if let block = self.passValueBlock1 {
            block(text)
        }
        
        if let block = self.passValueBlock2 {
            block(text)
        }
     
        
        /****************************** 通知传值  ************************************/
        
        NotificationCenter.default.post(name: NSNotification.Name.PassValueViewControllerPassedValue, object: text, userInfo: ["inputStr":text])
        
        
        /****************************** 单例传值  ************************************/

        CacheBean.shareInstance.name = text
        
        self.navigationController?.popViewController(animated: true)
    }
}


extension PassValueViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch:AnyObject in touches {
            let t:UITouch = touch as! UITouch
            let isTextField = t.view?.isKind(of: UITextField.classForCoder())
            if !isTextField! {
                self.view.endEditing(true)
                break
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


fileprivate extension Selector {
    
    static let testBtnMethod = #selector(PassValueViewController.testBtnClicked(_:))
    
}
