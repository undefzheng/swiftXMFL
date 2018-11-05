//
//  HomeViewController.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/10/30.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit
import DNSPageView

class HomeViewController: LYBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //创建DNSPageView样式
        let style = DNSPageStyle()
        style.isTitleViewScrollEnabled = false
        style.isTitleScaleEnabled = true
        style.isShowBottomLine = true
        style.titleSelectedColor = UIColor.black
        style.titleColor = UIColor.gray
        style.bottomLineColor = DominantColor
        style.bottomLineHeight = 1.5
        
        let titles = ["推荐","分类","VIP","直播","广播"]
        let viewControllers:[UIViewController] = [HomeRecommendVc(),HomeClassifyVc(),HomeVIPVc(),HomeLiveVc(),HomeBroacastVc()]
        
        for Vc in viewControllers {
            self.addChildViewController(Vc)
        }
        
        let pageView = DNSPageView(frame: CGRect(x: 0, y: navigationBarHeight, width: LYScreenWidth, height: LYScreenHeight-navigationBarHeight-44), style: style, titles: titles, childViewControllers: viewControllers)
        view.addSubview(pageView)
        
    }
}
