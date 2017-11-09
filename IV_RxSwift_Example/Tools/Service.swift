//
//  Service.swift
//  IV_RxSwift_Example
//
//  Created by IvanLee on 2017/10/27.
//  Copyright © 2017年 lifan666. All rights reserved.
//

import UIKit
import Moya

let provider = MoyaProvider<Service>()

enum Service {
    case news(param: [String: String])
}

extension Service: TargetType {
    var baseURL: URL {
        return URL.init(string: GlobalVariable.mainURLStr)!
    }
    
    var path: String {
        switch self {
        case .news:
            return "/toutiao/index"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .news(param: let param):
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
