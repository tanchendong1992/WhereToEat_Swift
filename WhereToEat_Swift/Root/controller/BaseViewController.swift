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
    
    var tabController : TabBarViewController?
    
    var titleLabel : UILabel?
    var backBtn : UIButton?
    
    var topView : UIView?
    var topBgView : UIView? {
        get {
            return self.topView?.viewWithTag(10010)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = .None
        
        self.createTopView()
        if self.navigationController?.viewControllers.count > 0 {
            self.addBackBtn()
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIMenuController.sharedMenuController().setMenuVisible(false, animated: true)
    }
    
    override func preferredStatusBarStyle() ->UIStatusBarStyle {
        return .LightContent
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func preferredStatusBarUpdateAnimation() ->UIStatusBarAnimation {
        return .None
    }
    
  override var navigationItem: UINavigationItem {
        get {
            let item : UINavigationItem = (self.navigationController?.navigationBar.topItem)!
            if item.isKindOfClass(UINavigationItem) {
                return item
            }else {
                return super.navigationItem
            }
        }
    }
    
    func createTopView(){
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
        titleLab.textColor = UIColor.redColor()
        titleLab.text = "md"
        topV.addSubview(titleLab)
        
        self.titleLabel = titleLab
        self.topView = topV
    }
    
    func addBackBtn() {
        let backButton : UIButton = UIButton.init(type: .Custom)
        backButton.frame = CGRectMake(4, 0, 44, 44)
        backButton.setImage(UIImage.init(named: ""), forState: .Normal)
        backButton.setImage(UIImage.init(named: ""), forState: .Highlighted)
        backButton.addTarget(self, action: #selector(BaseViewController.backBtnAction), forControlEvents: .TouchUpInside)
        self.topView?.addSubview(backButton)
        self.backBtn = backButton
    }
    
    func backBtnAction() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func customRightTextButton(text : NSString , action :Selector) -> UIButton {
        let btn : UIButton = UIButton.init(type: .Custom)
        btn.frame = CGRectMake(deviceWidth - 4 - 44, 0, 44, 44)
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        btn.setTitle(text as String, forState: .Normal)
        btn.addTarget(self, action: action, forControlEvents: .TouchUpInside)
        return btn
    }
    
    
    
    
    
    
    
    
    
    
    
}
