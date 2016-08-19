//
//  TabBarViewController.swift
//  WhereToEat_Swift
//
//  Created by 谭晨东 on 16/8/18.
//  Copyright © 2016年 谭晨东. All rights reserved.
//

import UIKit

class TabBarViewController: BaseViewController {
    
    var tabBar : UIView?
    var viewControllers : NSMutableArray = NSMutableArray.init(capacity: 0)
    var selectedIndex : NSInteger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTabBarView()
        self.creatTabBarViewController()
        self.setSelectedIndex(0)
    }
    
    func setSelectedIndex(index : NSInteger) {
        let oldSelectedIndex = selectedIndex
        self.selectedIndex = index
        
        for index in 0..<self.tabBarNum() {
            let btn : UIButton = tabBar?.viewWithTag(index) as! UIButton
            btn.selected = (index == selectedIndex)
        }
        if oldSelectedIndex >= 0 {
            self.removeViewController(viewControllers[oldSelectedIndex!] as! BaseViewController)
        }
        self.addViewController()
    }


    func createTabBarView() {
        if (tabBar == nil) {
            tabBar = UIView.init(frame: CGRectMake(0, deviceHeight - tabBarHeight, deviceWidth, tabBarHeight))
            tabBar?.autoresizingMask = .FlexibleTopMargin
            tabBar?.backgroundColor = UIColor.whiteColor()
            tabBar?.tag = 9999
            self.view.addSubview(tabBar!)

            for index in 0..<self.tabBarNum() {
                let btn : UIButton = UIButton.init(type: .Custom)
                // 将 Int 强制转换为CGFloat
                let i = CGFloat(Float(index))
                let num = CGFloat(Float(self.tabBarNum()))
                let x : CGFloat = i * deviceWidth / num
                
                btn.frame = CGRectMake(x, 2, deviceWidth / num, tabBarHeight - 2)
                btn.titleLabel?.font = UIFont.systemFontOfSize(12)
                btn.setTitleColor(UIColor.init(red: 137 / 255.0, green: 137 / 255.0, blue: 137 / 255.0, alpha: 1), forState: .Normal)
                btn.setTitleColor(UIColor.init(red: 253 / 255.0, green: 145 / 255.0, blue: 30 / 255.0, alpha: 1), forState: .Highlighted)
                btn.setTitleColor(UIColor.init(red: 253 / 255.0, green: 145 / 255.0, blue: 30 / 255.0, alpha: 1), forState: .Selected)
                btn.setTitle(self.tabBarTitleName()[index] as? String, forState: .Normal)
                btn.setImage(UIImage.init(named: self.tabBarIconName1()[index] as! String), forState: .Normal)
                btn.setImage(UIImage.init(named: self.tabBarIconName2()[index] as! String), forState: .Selected)
                btn.addTarget(self, action: #selector(TabBarViewController.buttonAction(_:)), forControlEvents: .TouchUpInside)
                btn.tag = index
                btn.titleEdgeInsets = UIEdgeInsetsMake(20, -btn.width, 0, 0)
                btn.imageEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0)
                tabBar?.addSubview(btn)
            }
        }
    }
    
    func buttonAction(sender : UIButton) {
        if selectedIndex !=  sender.tag {
            self.setSelectedIndex(sender.tag)
        }
    }
    
    func creatTabBarViewController() {
        viewControllers.addObjectsFromArray(self.tabBarViewController() as [AnyObject])
        for controller in viewControllers {
            if controller.isKindOfClass(BaseViewController) {
                let con = controller as! BaseViewController
                con.tabController = self
            }
        }
    }
    
    func removeViewController(controller : UIViewController) {
        controller.willMoveToParentViewController(nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    
    func addViewController() {
        let controller : UIViewController = viewControllers[selectedIndex!] as! UIViewController
        self.addChildViewController(controller)
        self.view.insertSubview(controller.view, atIndex: 0)
        controller.view.top = 0
        controller.didMoveToParentViewController(self)
    }
    
    
    func tabBarNum() -> NSInteger{
        return 5
    }
    func tabBarIconName1() -> NSArray {
        return  ["nav_home","nav_find","nav_more","nav_message","nav_mine"]
    }
    func tabBarIconName2() -> NSArray {
       return [ "nav_home_on", "nav_find_on", "nav_more", "nav_message_on", "nav_mine_on"]
    }
    func tabBarTitleName() -> NSArray {
        return [ "首页", "发现", "", "消息", "我的"]
    }
    func tabBarViewController() -> NSArray {
        return [HomePageViewController(),FoundViewController(),MoreViewController(),MessageViewController(),PersonalViewController()
        ];
    }
    
}
