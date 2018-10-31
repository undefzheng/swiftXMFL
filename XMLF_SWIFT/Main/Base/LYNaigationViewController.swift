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
        
    }
    
}

//MARK: push下一个控制器隐藏tabbar

extension LYNaigationViewController{
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
