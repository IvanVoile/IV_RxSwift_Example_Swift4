//
//  Observable+ObjectMapper.swift
//  AimiHealth-International
//
//  Created by Ivanlee on 2017/5/15.
//  Copyright © 2017年 Cupiday. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

extension Observable {
    
    func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map{ response in
            guard let dict = response as? [String: Any] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            return Mapper<T>().map(JSON: dict)!
        }
    }
    
    func mapArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map { response in
            guard let array = response as? [Any] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            
            guard let dicts = array as? [[String: Any]] else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            
            return Mapper<T>().mapArray(JSONArray: dicts)
        }
    }
}

enum RxSwiftMoyaError : Swift.Error {
    case ParseJSONError
    case NoRepresentor
    case NotSuccessfulHTTP
    case NoData
    case CouldNotMakeObjectError
    case BizError(resultCode: String, resultMsg: String)
}

extension RxSwiftMoyaError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .ParseJSONError:
            return "数据解析失败"
        case .NoRepresentor:
            return "NoRepresentor."
        case .NotSuccessfulHTTP:
            return "NotSuccessfulHTTP."
        case .NoData:
            return "NoData."
        case .CouldNotMakeObjectError:
            return "CouldNotMakeObjectError."
        case .BizError(resultCode: let resultCode, resultMsg: let resultMsg):
            return "错误码: \(resultCode), 错误信息: \(resultMsg)"
        }
    }
}
