//
//  RxExtension.swift
//  IV_RxSwift_Example
//
//  Created by IvanLee on 2017/10/18.
//  Copyright © 2017年 lifan666. All rights reserved.
//

import UIKit
import RxSwift

// MARK: - Error Extension

enum IVError: Swift.Error {
    case loadingFailed
    case noData
    case jsonFormattingFailed
}

extension IVError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .jsonFormattingFailed:
            return "数据格式转换失败。"
        case .loadingFailed:
            return "加载失败。"
        case .noData:
            return "没有数据"
        }
    }
}

// MARK: - Result Extension

enum Result {
    case empty
    case succeed(message: String)
    case failed(error: IVError)
}

extension Result {
    var isValid: Bool {
        switch self {
        case .succeed:
            return true
        default:
            return false
        }
    }
    
    var description: String {
        switch self {
        case .empty:
            return ""
        case .succeed(message: let message):
            return message
        case .failed(error: let err):
            return err.errorDescription!
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .empty:
            return UIColor.white
        case .failed:
            return UIColor.red
        case .succeed:
            return UIColor.black
        }
    }
}


