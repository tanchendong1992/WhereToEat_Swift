//
//  RootNavigationController.swift
//  WhereToEat_Swift
//
//  Created by 谭晨东 on 16/8/19.
//  Copyright © 2016年 谭晨东. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController {
    let tabController : TabBarViewController? = nil
    
    static let sharedInstance = RootNavigationController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarHidden = true
        
        let controller : TabBarViewController = TabBarViewController.init()
        self.viewControllers = [controller]
    }
}
