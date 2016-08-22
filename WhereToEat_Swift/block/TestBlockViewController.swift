//
//  TestBlockViewController.swift
//  WhereToEat_Swift
//
//  Created by 谭晨东 on 16/8/22.
//  Copyright © 2016年 谭晨东. All rights reserved.
//

import UIKit

class TestBlockViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.testBlock { (message) in
            
        }
    }
    // 闭包
    func testBlock(block:(message : NSString) -> ()){
        
    }
}
