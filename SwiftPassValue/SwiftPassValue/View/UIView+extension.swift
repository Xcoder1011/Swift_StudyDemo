//
//  UIView+extension.swift
//  SwiftPassValue
//
//  Created by shangkun on 2019/1/16.
//  Copyright © 2019年 wushangkun. All rights reserved.
//

import Foundation
import UIKit

private var kun_placeholderKey: Void?
private var kun_deallocHookerKey = "kun_deallocHookerKey"

extension UITextView {
    
    var placeholderLabel: UILabel? {
      
        get {
            var label: UILabel? = objc_getAssociatedObject(self, &kun_placeholderKey) as? UILabel
            if label == nil {
                label = UILabel.init()
                label?.textColor = UIColor.lightGray
                label?.numberOfLines = 0
                label?.isUserInteractionEnabled = false
                objc_setAssociatedObject(self, &kun_placeholderKey, label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.updatePlaceholderLabel), name: NSNotification.Name.UITextViewTextDidChange, object: self)
                
                let observingKeys = ["text","attributedText","bounds","font","frame","textAlignment","textContainerInset"]
                for key in observingKeys {
                    self.addObserver(self, forKeyPath: key, options: .new, context: nil)
                }
                
                let hooker = DeallocHooker()
                hooker.deallocHandle = { [weak self] in
                    NotificationCenter.default.removeObserver(self as Any)
                    for key in observingKeys {
                        self?.removeObserver(self!, forKeyPath: key)
                    }
                }
                objc_setAssociatedObject(self, &kun_deallocHookerKey,hooker, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            
            return label
        }
        
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        updatePlaceholderLabel()
    }
    
    
    @objc func updatePlaceholderLabel() {
        
        if self.text.count > 0 {
            self.placeholderLabel?.removeFromSuperview()
            return
        }
        if let placeLabel = self.placeholderLabel {
            insertSubview(placeLabel, at: 0)
            placeLabel.textAlignment = self.textAlignment
            placeLabel.font = self.font
            let X = self.textContainer.lineFragmentPadding + self.textContainerInset.left
            let Y = self.textContainerInset.top
            let WIDTH = (self.bounds.width - X - self.textContainer.lineFragmentPadding - self.textContainerInset.right)
            let HEIGHT = placeLabel.sizeThatFits(CGSize(width: WIDTH, height: 0)).height
            placeLabel.frame = CGRect(x: X, y: Y, width: WIDTH, height: HEIGHT)
        }
    }
    
    class DeallocHooker: NSObject {
        typealias DeallocHookerHandle = () -> Void
        var deallocHandle:DeallocHookerHandle?
        deinit {
            if deallocHandle != nil {
                print("DeallocHandle")
                deallocHandle!()
            }
        }
    }
}
