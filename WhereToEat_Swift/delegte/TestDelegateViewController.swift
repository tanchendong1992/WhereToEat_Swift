//
//  TestDelegateViewController.swift
//  WhereToEat_Swift
//
//  Created by 谭晨东 on 16/8/22.
//  Copyright © 2016年 谭晨东. All rights reserved.
//

import UIKit
// 代理
protocol ShopClassifyViewDelegate {
    func trueOrCancelChoose(currentType : String)
}

class TestDelegateViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
