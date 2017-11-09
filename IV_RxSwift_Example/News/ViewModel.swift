//
//  ViewModel.swift
//  IV_RxSwift_Example
//
//  Created by IvanLee on 2017/10/27.
//  Copyright © 2017年 lifan666. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class ViewModel {
    
    let disposeBag = DisposeBag()
//    let variable = Variable<Void>()
    let showVariable = Variable<String>("")

    func loadNews() -> Observable<Any> {
        return provider.rx
            .request(.news(param: ["key": "6a74cfd948ecf2542d8bd85bf9cca0b0"]))
            .mapJSON()
            .asObservable()
            .filterSuccessfulStatusCodes()
    }
}
