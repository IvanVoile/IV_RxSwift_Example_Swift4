//
//  GlobalVariable.swift
//  IV_RxSwift_Example
//
//  Created by IvanLee on 2017/10/18.
//  Copyright © 2017年 lifan666. All rights reserved.
//

import UIKit

class GlobalVariable: NSObject {
    
    static let mainURLStr = "http://v.juhe.cn"
    // 屏幕宽高
    static let kScreenWidth = UIScreen.main.bounds.width
    static let kScreenHeight = UIScreen.main.bounds.height
    // 版本号
    static let CurrentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    static let BuildVersion = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    
    
    
    
}
