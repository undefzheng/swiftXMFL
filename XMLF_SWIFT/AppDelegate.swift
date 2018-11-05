//
//  AppDelegate.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/10/30.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit
import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width: LYScreenWidth, height: LYScreenHeight))
        let tab = self.customIrregularityStyle(delegate: self as? UITabBarControllerDelegate)
        self.window?.rootViewController = tab
        self.window?.makeKeyAndVisible()
       
//        self.setFistImage()
        
        return true
    }
    
    
    /// 加载首次过渡图
    func setFistImage(){
        let imageList: [String] = ["lead01", "lead02", "lead03"]
        let guideView = LYGuidePageHUD.init(imageList: imageList, isHiddenBtn: true)
        self.window?.rootViewController?.view.addSubview(guideView)
    }

    /// 加载tabbar底部样式
    ///
    /// - Parameter delegate: 代理
    /// - Returns: 返回tabbar
    func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> ESTabBarController{
        
        let tabBarController = ESTabBarController()
        tabBarController.delegate = delegate
        tabBarController.title = "首页"
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        //劫持点击操作
        tabBarController.shouldHijackHandler = {
            tabBarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                //                let vc = FMPlayController()
                //                tabBarController?.present(vc, animated: true, completion: nil)
            }
        }
        
        
        //控制器
        let v1 = HomeViewController()
        let v2 = ListenViewController()
        let v3 = PlayViewController()
        let v4 = FindViewController()
        let v5 = MineViewController()
        
        v1.tabBarItem = ESTabBarItem.init(LYBasicLrregularContenView(), title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = ESTabBarItem.init(LYBasicLrregularContenView(), title: "我听", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(LYLrregularContenView(), title: nil, image: UIImage(named: "tab_play"), selectedImage: UIImage(named: "tab_play"))
        v4.tabBarItem = ESTabBarItem.init(LYBasicLrregularContenView(), title: "发现", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = ESTabBarItem.init(LYBasicLrregularContenView(), title: "我的", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        let nv1 = LYNaigationViewController.init(rootViewController: v1)
        let nv2 = LYNaigationViewController.init(rootViewController: v2)
        let nv3 = LYNaigationViewController.init(rootViewController: v3)
        let nv4 = LYNaigationViewController.init(rootViewController: v4)
        let nv5 = LYNaigationViewController.init(rootViewController: v5)
        v1.title = "首页"
        v2.title = "我听"
        v3.title = ""
        v4.title = "发现"
        v5.title = "我的"
        
        tabBarController.viewControllers = [nv1,nv2,nv3,nv4,nv5]
        
        return tabBarController
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

