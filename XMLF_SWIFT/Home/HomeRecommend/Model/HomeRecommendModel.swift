//
//  HomeRecommendModel.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/11/1.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit
import HandyJSON


struct AdverShareDate: HandyJSON {
    var linkUrl: String?
    var linkTitle: String?
    var linkConverPath: String?
    var linkContent: String?
    var isExternalUrl: Bool = false
}

struct RecommnedAdverModel: HandyJSON {
    var shareData: AdverShareDate?
    var isShareFlag: Bool = false
    var thirdStatUrl: String?
    var thirdShowStatUrls: [Any]?
    var thirdClickStatUrls: [Any]?
    var showTokens: [Any]?
    var clickTokens: [Any]?
    var recSrc: String?
    var recTrack: String?
    var link: String?
    var realLink: String?
    var adMark: String?
    var isLandScape: Bool = false
    var isInternal: Int = 0
    var bucketIds: String?
    var adpr: String?
    var planId: String?
    var cover: String?
    var showstyle: String?
    var name: String?
    var scheme: String?
    var description: String?
    var linkType: Int = 0
    var displayType: Int = 0
    var clickType: Int = 0
    var openlinkType:Int = 0
    var loadingShowTime: Int = 0
    var apkUrl: String?
    var adtype: Int = 0
    var auto: Bool = false
    var position: Int = 0
    var subConver: String?
    var subName: String?
    var adid: Int = 0
    
}
