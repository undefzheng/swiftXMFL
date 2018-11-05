//
//  HomeRecommendHeaderView.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/11/2.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

//创建闭包
typealias btnClick = () ->Void

class HomeRecommendHeaderView: UICollectionReusableView {

    var homercommendBtuttonClik : btnClick?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //设置UI
    func setUI() {
        self.addSubview(self.titleLbl)
        self.addSubview(self.subLabel)
        self.addSubview(self.homeBtn)
        
        self.titleLbl.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
    }
    
    //MARK: 懒加载
    lazy var titleLbl: UILabel = {
        let labl = UILabel()
        labl.text = "测试"
        labl.font = UIFont.systemFont(ofSize: 20)
        return labl
    }()
    
    lazy var subLabel: UILabel = {
        let subLbl = UILabel()
        subLbl.text = "测试的"
        subLbl.font = UIFont.systemFont(ofSize: 15)
        subLbl.textColor = UIColor.lightGray
        return subLbl
    }()
    
    lazy var homeBtn: UIButton = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        button.setTitle("点击", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(homeBtnClick), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    //MARK: 点击事件
    @objc func homeBtnClick(Button:UIButton){
        guard let homercommendBtuttonClik = homercommendBtuttonClik else {
            return
        }
        homercommendBtuttonClik()
    }
}
