//
//  BaseViewController.swift
//  WhereToEat_Swift
//
//  Created by 谭晨东 on 16/8/16.
//  Copyright © 2016年 谭晨东. All rights reserved.
//

import UIKit

import Cartography

class BaseViewController: UIViewController {
    
    
    
    var titleLabel : UILabel?
    var backBtn : UIButton?
    
    var topView : UIView? {
        get {
            if self.topView == nil {
                let topV : UIView = UIView.init(frame: CGRectMake(0, 20, deviceWidth, topBarHeight))
                self.view.addSubview(topV)
                
                let topBgV : UIView = UIView.init(frame: CGRectMake(0, -20, deviceWidth, topBarHeight + 20))
                topBgV.backgroundColor = UIColor.init(red: 253/255.0, green: 145/255.0, blue: 30/255.0, alpha: 1)
                topBgV.tag = 10010
                topV.addSubview(topBgV)
                
                let titleLab : UILabel = UILabel.init(frame: CGRectMake(44, (topV.height - topBarHeight) / 2.0, deviceWidth - 88, topBarHeight))
                titleLab.textAlignment = .Center
                titleLab.font = UIFont.systemFontOfSize(17)
                titleLab.backgroundColor = UIColor.clearColor()
                topV.addSubview(titleLab)
                
                self.titleLabel = titleLab;
                
                return topV
            }
            return self.topView
        }
    }
    
    var topBgView : UIView? {
        get {
            return self.topView?.viewWithTag(10010)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = .None
        
        self.topView
        
        
    }
    
    func addBackBtn() {
        let backBtn : UIButton = UIButton.init(type: .Custom)
        backBtn.frame = CGRectMake(4, 0, 44, 44)
        backBtn.setImage(UIImage.init(named: ""), forState: .Normal)
        backBtn.setImage(UIImage.init(named: ""), forState: .Highlighted)
        backBtn.addTarget(self, action: #selector(BaseViewController.backBtnAction), forControlEvents: .TouchUpInside)
        self.topView?.addSubview(backBtn)
    }
    
    func backBtnAction() {
        
    }
    
    
}
