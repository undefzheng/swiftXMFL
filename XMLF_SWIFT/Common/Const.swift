//
//  Const.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/10/31.
//  Copyright © 2018 appscomm. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit
import SwiftyJSON
import HandyJSON
import SwiftMessages



let LYScreenWidth = UIScreen.main.bounds.size.width
let LYScreenHeight = UIScreen.main.bounds.size.height


let DominantColor = UIColor.init(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let FooterViewColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)

// iphone X
let isIphoneX = LYScreenHeight == 812 ? true : false
// navigationBarHeight
let navigationBarHeight : CGFloat = isIphoneX ? 88 : 64
// tabBarHeight
let tabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49
