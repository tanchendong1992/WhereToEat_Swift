//
//  ViewController.swift
//  WhereToEat_Swift
//
//  Created by 谭晨东 on 16/8/16.
//  Copyright © 2016年 谭晨东. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "www.baidu.com"
        Alamofire.request(.GET, urlString, parameters: nil, encoding: .JSON, headers: nil).responseJSON { (JSON) in
            print(JSON)
        }
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

