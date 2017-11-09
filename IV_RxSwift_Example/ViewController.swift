//
//  ViewController.swift
//  IV_RxSwift_Example
//
//  Created by IvanLee on 2017/10/18.
//  Copyright © 2017年 lifan666. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import SwiftyJSON

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var mainTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doBinding()
        
        let viewModel = ViewModel()
        viewModel.loadNews().subscribe({event in
//            switch event {
//            case .next(let element):
//                debugPrint(JSON.init(data: element.data))
//            case .error(let err):
//                debugPrint(err.localizedDescription)
//            case .completed:
//                debugPrint("Complete.")
//            }
            debugPrint(event.element)
        }).disposed(by: disposeBag)
    }
    
    fileprivate func doBinding() {
        mainTableView.rx.base.allowsMultipleSelection = true
        mainTableView.rx.base.dataSource = self
        mainTableView.rx.base.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

