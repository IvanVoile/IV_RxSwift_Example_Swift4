//
//  UIKit+Extension.swift
//  IV_RxSwift_Example
//
//  Created by IvanLee on 2017/10/18.
//  Copyright © 2017年 lifan666. All rights reserved.
//

import UIKit
import Foundation

extension UIView {
    
    public var iv_x: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect .init(x: value, y: self.iv_y, width: self.iv_w, height: self.iv_h)
        }
    }
    
    public var iv_y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect.init(x: self.iv_x, y: value, width: self.iv_w, height: self.iv_h)
        }
    }
    
    public var iv_w: CGFloat {
        get {
            return self.frame.width
        } set(value) {
            self.frame = CGRect.init(x: self.iv_x, y: self.iv_y, width: value, height: self.iv_h)
        }
    }
    
    public var iv_h: CGFloat {
        get {
            return self.frame.height
        } set(value) {
            self.frame = CGRect.init(x: self.iv_x, y: self.iv_y, width: self.iv_w, height: value)
        }
    }
    
    public var iv_size: CGSize {
        get {
            return self.frame.size
        } set(value) {
            self.frame = CGRect.init(origin: self.iv_origen, size: value)
        }
    }
    
    public var iv_origen: CGPoint {
        get {
            return self.frame.origin
        } set(value) {
            self.frame = CGRect.init(origin: value, size: self.iv_size)
        }
    }
    
    public var iv_left: CGFloat {
        get {
            return self.iv_x
        } set(value) {
            self.iv_x = value
        }
    }
    
    public var iv_right: CGFloat {
        get {
            return self.iv_x + self.iv_w
        } set(value) {
            self.iv_x = value - self.iv_w
        }
    }
    
    public var iv_top: CGFloat {
        get {
            return self.iv_y
        } set(value) {
            self.iv_y = value
        }
    }
    
    public var iv_bottom: CGFloat {
        get {
            return self.iv_y + self.iv_h
        } set(value) {
            self.iv_y = value - self.iv_h
        }
    }
    
    public var iv_centerX: CGFloat {
        get {
            return self.center.x
        } set(value) {
            self.center.x = value
        }
    }
    
    public var iv_centerY: CGFloat {
        get {
            return self.center.y
        } set(value) {
            self.center.y = value
        }
    }
}

private let UIViewAnimationDuration: TimeInterval = 1
private let UIViewAnimationSpringDamping: CGFloat = 0.5
private let UIViewAnimationSpringVelocity: CGFloat = 0.5

extension UIView {
    
    public func setScale(x: CGFloat, y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DScale(transform, x, y, 1)
        self.layer.transform = transform
    }
    
    public func spring(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: UIViewAnimationSpringDamping, initialSpringVelocity: UIViewAnimationSpringVelocity, options: UIViewAnimationOptions.allowAnimatedContent, animations: animations, completion: completion)
    }
    
    public func spring(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        spring(duration: UIViewAnimationDuration, animations: animations, completion: completion)
    }
    
    public func animate(duration: TimeInterval, animation: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: animation, completion: completion)
    }
    
    public func animate(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        animate(duration: UIViewAnimationDuration, animation: animations, completion: completion)
    }
    
    public func pop() {
        setScale(x: 1.1, y: 1.1)
//        spring(duration: 0.2, animations: ({ [unowned self] in
//            self.setScale(x: 1.0, y: 1.0)
//        }))
        spring(duration: 0.2, animations: { [unowned self] in
            self.setScale(x: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    public func bigPop() {
        setScale(x: 1.25, y: 1.25)
        spring(duration: 0.2, animations: ({ [unowned self] in
            self.setScale(x: 1.0, y: 1.0)
        }))
    }
    
    public func reversePop() {
        setScale(x: 0.9, y: 0.9)
        spring(duration: 0.2, animations: ({ [unowned self] in
            self.setScale(x: 1.0, y: 1.0)
        }))
    }
}

extension UIImageView {
    
    // 贝赛尔曲线画圆
    public func iv_drawCircle(size: CGSize) {
        let imageView = self
        UIGraphicsBeginImageContext(size)
        let path = UIBezierPath.init(ovalIn: imageView.bounds)
        path.addClip()
        imageView.draw(imageView.bounds)
//        imageView.image = 
    }
}
