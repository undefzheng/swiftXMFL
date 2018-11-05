//
//  HomeRecommendVc.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/11/1.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
import SwiftMessages

class HomeRecommendVc: UIViewController {

    //状态提示框
    let otherMessager = SwiftMessages()
    
    //数据模型(广告的数据)
    private var recommendList: [RecommnedAdverModel]?
    
    //collectionView is viewID and cellID
    private let FMHomeRecommendHeadViewID = "FMHomeRecommendHeadViewID"
    private let FMHomeRecommendFooterViewID = "FMHomeRecommendFooterViewID"
    
    private let FMHomeRecommendHeadCellID = "FMHomeRecommendHeadCellID"
    
    //生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //collectionView是懒加载
        self.view.addSubview(collectionView)
        //进行约束
        self.collectionView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
//        self.collectionView.uHead.beginRefreshing()
        
    }
    
    //懒加载collertionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout.init()
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        
        //注册头视图 尾视图
        collection.register(HomeRecommendHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: FMHomeRecommendHeadViewID)
        collection.register(UIView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: FMHomeRecommendFooterViewID)
        
        //注册cell
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: FMHomeRecommendHeadCellID)
        
        return collection
    }()
    
}

//MARK: collectionView  代理协议
extension HomeRecommendVc: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
   
    //返回行数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    //cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! UICollectionViewCell
        return cell
        
    }
    
    //头部和底部的高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: LYScreenWidth, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: LYScreenWidth, height: 60)
    }
    
    //头视图和尾视图
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind ==  UICollectionElementKindSectionHeader{
           //创建view
            let headView :HomeRecommendHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: UICollectionElementKindSectionHeader, for: indexPath) as! HomeRecommendHeaderView
            
//            HomeRecommendHeaderView.homeBtnClick = {[weak self]() in
//                
//            }
//            
            return headView
            
            
        }else if kind == UICollectionElementKindSectionFooter{
            
        }
        
        return UICollectionReusableView()
    }
    
}
