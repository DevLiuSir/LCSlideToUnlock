//
//  ViewController.swift
//  LCSlideToUnlockExample
//
//  Created by Liu Chuan on 2018/2/25.
//  Copyright © 2018年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /******* LCSlideToUnlockView *******/
        let slideToUnlockView = LCSlideToUnlockView(frame: CGRect(x: 0, y: view.bounds.height - 100, width: view.bounds.width, height: 40))
        slideToUnlockView.textStr = "> Slide To Unlock "
        slideToUnlockView.textColor = .black
        slideToUnlockView.shimmerColors = [.white, .white]
        //slideToUnlockView.shimmerImage = UIImage(named: "gradient")
        slideToUnlockView.font = UIFont.systemFont(ofSize: 20)
        slideToUnlockView.animationDirection = .horizontal
        slideToUnlockView.isEnableAutoreverses = false
        slideToUnlockView.showFadeWithDuration(4)
        view.addSubview(slideToUnlockView)
    }
}
