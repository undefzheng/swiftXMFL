//
//  LYGuidePageHUD.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/10/30.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LYGuidePageHUD: UIView {

    var imageArray: [String]?
    var guidePageScrollView: UIScrollView!
    var imagePageControl: UIPageControl?
    
    
    /// init
    ///
    /// - Parameters:
    ///   - imageList: 图片数组
    ///   - isHiddenBtn: 是否显示跳按钮
    init(imageList:[String], isHiddenBtn:Bool) {
        let frame = CGRect.init(x: 0, y: 0, width: LYScreenWidth, height: LYScreenHeight)
        super.init(frame: frame)
        self.imageArray = imageList
        if self.imageArray == nil || self.imageArray?.count == 0 {
            return;
        }
        self.addScrollerView(frame: frame)
        self.addButtonClick(isHiddenSkipButton: isHiddenBtn)
        self.addImageList()
        self.addPageContror()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit")
    }
}

//MARK:类似分类
extension LYGuidePageHUD {
    
    
    /// 创建scrollView
    ///
    /// - Parameter frame: 位置
    func addScrollerView(frame: CGRect) -> Void {
        self.guidePageScrollView = UIScrollView.init(frame: frame)
        self.guidePageScrollView.backgroundColor = UIColor.white
        self.guidePageScrollView.contentSize = CGSize.init(width: LYScreenWidth * (CGFloat)((self.imageArray?.count)!), height: LYScreenHeight)
        self.guidePageScrollView.bounces = false
        self.guidePageScrollView.isPagingEnabled = true
        self.guidePageScrollView.showsHorizontalScrollIndicator = false
        self.guidePageScrollView.delegate = self
        self.addSubview(self.guidePageScrollView)
    }
    
    /// 创建跳过按钮
    ///
    /// - Parameter isHiddenSkipButton: 是否显示
    func addButtonClick(isHiddenSkipButton: Bool) -> Void {
        if isHiddenSkipButton {
            return
        }
        let skipButton = UIButton.init(frame: CGRect.init(x: LYScreenWidth * 0.8, y: LYScreenWidth * 0.1, width: 80, height: 30))
        skipButton.setTitle("跳过", for: .normal)
        skipButton.backgroundColor = UIColor.yellow
        skipButton.setTitleColor(UIColor.white, for: .normal)
        skipButton.layer.cornerRadius = skipButton.frame.size.width * 0.3
        skipButton .addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
        self.addSubview(skipButton)
    }
    
    
    /// 点击方法
    @objc func skipButtonClick() -> Void{
        UIView.animate(withDuration: 1, animations: {
            self.alpha = 0
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    
    
    /// 添加图片数组
    func addImageList() -> Void {
        guard let imageArray = self.imageArray else {
            return
        }
        
        for i in 0..<imageArray.count {
            let imageViewS = UIImageView.init(frame: CGRect.init(x: LYScreenWidth * CGFloat(i), y: 0, width: LYScreenWidth, height: LYScreenHeight))
            imageViewS.image = UIImage.init(named: imageArray[i])
            self.guidePageScrollView.addSubview(imageViewS)
            
            if i == imageArray.count - 1 {
                imageViewS.isUserInteractionEnabled = false
                let startButton = UIButton.init(frame: CGRect.init(x: LYScreenWidth * 0.1, y: LYScreenHeight * 0.8, width: LYScreenWidth*0.8, height: LYScreenHeight*0.08))
                startButton.setTitle("开始体验", for: .normal)
                startButton.setTitleColor(UIColor.white, for: .normal)
                startButton.setImage(UIImage.init(named: "guide_btn_bg"), for: .normal)
                startButton.addTarget(self, action: #selector(skipButtonClick), for: .touchUpInside)
                self.guidePageScrollView.addSubview(startButton)
            }
        }
    }
    
    
    /// 添加当前页的指示点
    func addPageContror() -> Void {
        self.imagePageControl = UIPageControl.init(frame: CGRect.init(x: 0, y: LYScreenHeight * 0.9, width: LYScreenWidth, height: LYScreenHeight * 0.1))
        self.imagePageControl?.currentPage = 0;
        self.imagePageControl?.numberOfPages = self.imageArray?.count ?? 0
        self.imagePageControl?.pageIndicatorTintColor = UIColor.gray
        self.imagePageControl?.currentPageIndicatorTintColor = UIColor.white
        self.addSubview(self.imagePageControl!)
    }
    
}

//MARK :代理方法
extension LYGuidePageHUD: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        self.imagePageControl?.currentPage = Int(page)
    }
}
