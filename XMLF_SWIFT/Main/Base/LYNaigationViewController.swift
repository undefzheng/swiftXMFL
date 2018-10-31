//
//  LYNaigationViewController.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/10/30.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LYNaigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarAppearen()
    }
    
    func setNavBarAppearen(){
        
        /* 采用WRNavigation第三方库的导航栏 */
        
        // 设置导航栏默认的背景颜色
        WRNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        // 设置导航栏所有按钮的默认颜色
        WRNavigationBar.defaultNavBarTintColor = DominantColor
        //设备标题颜色
        WRNavigationBar.defaultNavBarTitleColor = .black
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        WRNavigationBar.defaultShadowImageHidden = true
    }
}

//MARK: push下一个控制器隐藏tabbar

extension LYNaigationViewController{
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
