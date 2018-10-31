//
//  LYBouncesContenView.swift
//  XMLF_SWIFT
//
//  Created by 不才 on 2018/10/30.
//  Copyright © 2018 appscomm. All rights reserved.
//

import UIKit

class LYBouncesContenView: LYBasicContentView {

    public var duration = 0.3
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    func bounceAnimation() -> Void {
        let anmation = CAKeyframeAnimation(keyPath: "transform.scale")
        anmation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        anmation.duration = duration * 2
        anmation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(anmation, forKey: nil)
    }
}
