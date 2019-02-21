//
//  BaseReceiveResultController.swift
//  SwiftPassValue
//
//  Created by shangkun on 2019/1/16.
//  Copyright © 2019年 wushangkun. All rights reserved.
//

import UIKit

class BaseReceiveResultController: UIViewController {

    lazy var textView:UITextView = {
        let textView = UITextView.init()
        textView.isEditable = false
        textView.layer.borderColor = UIColor.red.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 4;
        textView.font = UIFont.boldSystemFont(ofSize: 15)
        textView.placeholderLabel?.text = "传过来的参数在这里显示"
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createUI()
    }
    
    func createUI() {
        
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(textView.superview!).offset(150)
            make.width.equalToSuperview().multipliedBy(3.0/4)
            make.height.equalTo(textView.snp.width).multipliedBy(0.5)
        }
        
        let btn = UIButton.init(type: .system)
        btn.setTitle("PUSH", for: .normal)
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
        gradientLayer.colors = [UIColor(hex: "#F6416C").cgColor, UIColor(hex: "#FFF6B7").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.locations = [0,1]
        btn.layer.insertSublayer(gradientLayer, at: 0)
    }

    @objc func testBtnClicked( _ btn:UIButton) {
        
        // for sub class override ...
    }
    
    deinit {
        print("\(NSStringFromClass(self.classForCoder)) dealloc")
    }
}

fileprivate extension Selector {
    
    static let testBtnMethod = #selector(BaseReceiveResultController.testBtnClicked(_:))

}
