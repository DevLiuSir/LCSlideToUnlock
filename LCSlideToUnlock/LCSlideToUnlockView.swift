//
//  LCSlideToUnlockView.swift
//  LCSlideToUnlockExample
//
//  Created by Liu Chuan on 2018/2/24.
//  Copyright © 2018年 LC. All rights reserved.
//

import UIKit

/// locations: 分割动画
private let LCgradientViewAnimationKey = "locations"

/// 滑动来解锁视图
class LCSlideToUnlockView: UIView {
    
    // MARK: - 属性
    
    /// 文本标签
    private lazy var textLabel = UILabel()

    /// 渐变图层
    private lazy var gradientLayer = CAGradientLayer()
    
    /// 内容图层
    private lazy var contentLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = self.textColor.cgColor
        layer.bounds = self.bounds
        layer.anchorPoint = CGPoint.zero    // 锚点 (0, 0)位置
        self.layer.addSublayer(layer)
        layer.mask = self.textLabel.layer
        return layer
    }()
    
    /// 闪烁图层
    private lazy var shimmerLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.bounds = self.bounds
        layer.colors = self.shimmerColors.map({ $0.cgColor })
        layer.anchorPoint = CGPoint.zero
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        self.contentLayer.addSublayer(layer)
        return layer
    }()
    
    /// 文字
    public var textStr: String = "" {
        didSet {
            textLabel.text = textStr
        }
    }

    /// 持续时长
    public var duration: TimeInterval = 2.0 {
        didSet {
        }
    }
    
    /// 渐变图片 (跟 `colors` 只能设置一个)
    public var shimmerImage = UIImage(named: "gradient") {
        didSet{
            shimmerLayer.colors = nil
            shimmerLayer.contents = shimmerImage?.cgImage
        }
    }
    
    /// 渐变颜色组 (最少两个元素, 跟 `gradientImage` 只能设置一个)
    public var shimmerColors = [UIColor.white, UIColor.white] {
        didSet {
            shimmerLayer.contents = nil
            shimmerLayer.colors = shimmerColors.map({ $0.cgColor })
        }
    }
 
    /// 文字颜色
    public var textColor = UIColor.black {
        didSet {
            contentLayer.backgroundColor = textColor.cgColor
        }
    }
    
    /// 字体
    public var font: UIFont = UIFont.systemFont(ofSize: 13) {
        didSet {    // 监听数值font的改变
            textLabel.font = font
        }
    }
    
    // MARK: - 初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configLabel()
        configGradientLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Method
extension LCSlideToUnlockView {
    
    /// 创建UILabel
    private func configLabel() {
        textLabel = UILabel(frame: bounds)
        textLabel.text = textStr
        textLabel.textAlignment = .center
        addSubview(textLabel)
    }
    
    /// 配置渐变图层
    private func configGradientLayer() {

        // 渐变图层和当前视图view等宽高
        gradientLayer.bounds = bounds
        
        // 渐变图层的锚点
        gradientLayer.anchorPoint = CGPoint.zero
        
        // 设置渐变的开始点、结束点
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        // 设置渐变中的每一个渐变点.即渐变颜色数组
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]

        // 设置每个渐变点颜色对应的位置
        gradientLayer.locations = [0.2, 0.5, 0.8]
        
        contentLayer.addSublayer(gradientLayer)
        
        // 将gradientLayer作为闪烁视图layer的遮罩
        shimmerLayer.mask = gradientLayer
        
        configAnimation()
    }
    
    /// 配置动画
    private func configAnimation() {
        
        // 1> 创建基于CAlayer层的动画, 通过 "locations" 创建UIView动画
        // locations: 分割动画
        let basicAnimation = CABasicAnimation(keyPath: LCgradientViewAnimationKey)
        
        // 2> 设置动画相关属性
        // fromValue: 动画当前值
        // toValue: 动画目标值
        basicAnimation.fromValue = [0, 0, 0.2]
        basicAnimation.toValue = [0.8, 1, 1]
        
        // 动画的持续时间
        basicAnimation.duration = duration
        // 动画的重复次数
        basicAnimation.repeatCount = MAXFLOAT
        // 完成后是否删除动画
        basicAnimation.isRemovedOnCompletion = false
        // 动画的填充模式, 返回到原点
        basicAnimation.fillMode = kCAFillModeForwards
        
        // 3> 添加动画
        gradientLayer.add(basicAnimation, forKey: nil)
    }
  
    /// 显示淡影淡出效果
    ///
    /// - Parameter du: 持续时长
    public func showFadeWithDuration(_ du: TimeInterval) {
        duration = du
        gradientLayer.removeAllAnimations() // 移除动画,再添加
        configAnimation()
    }
    
}
