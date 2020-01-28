<p align="center"> 
<img  src="https://github.com/DevLiuSir/LCSlideToUnlock/raw/master/Screencast/LCSlideToUnlock.png" width="500" height="500"></p>

<p align="center"> <b>LCSlideToUnlock is a simple slide to unlock iOS UI component.</b></p> 


![language](https://img.shields.io/badge/language-swift-orange.svg)
[![swift version](https://img.shields.io/badge/swift-5+-blue.svg?style=flat)](https://developer.apple.com/swift/)
![xcode version](https://img.shields.io/badge/xcode-11+-red.svg)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/LCSlideToUnlock.svg)](#cocoapods) 
![build state](https://img.shields.io/badge/build-passing-brightgreen)
![GitHub top language](https://img.shields.io/github/languages/top/DevLiuSir/LCSlideToUnlock?color=blueviolet)
![https://github.com/DevLiuSir/LCSlideToUnlock/blob/master/LICENSE](https://img.shields.io/github/license/DevLiuSir/LCSlideToUnlock.svg)
![platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/DevLiuSir/LCSlideToUnlock?color=ff69b4&label=codeSize)
![commits count](https://badgen.net/github/commits/DevLiuSir/LCSlideToUnlock)
![GitHub last commit](https://img.shields.io/github/last-commit/DevLiuSir/LCSlideToUnlock)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/DevLiuSir/LCSlideToUnlock)
![Github Star](https://img.shields.io/github/stars/DevLiuSir/LCSlideToUnlock.svg?style=social&label=Star)
![GitHub forks](https://img.shields.io/github/forks/DevLiuSir/LCSlideToUnlock?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/DevLiuSir/LCSlideToUnlock?style=social)
[![Twitter Follow](https://img.shields.io/twitter/follow/LiuChuan_.svg?style=social)](https://twitter.com/LiuChuan_)


---


## Requirements

- iOS 13+
- Xcode 11+
- Swift 5.1+

## Screencast

<div align=center> 
<img src="https://github.com/DevLiuSir/LCSlideToUnlock/raw/master/Screencast/Screencast02.png" width="300">
</div>


## Effect of collection

- **Using enumerations to define `LCSlideToUnlock` animation types**


```swift
/// 动画方向
///
/// - horizontal: 水平
/// - vertical: 垂直
/// - diagonalUp: 对角线往上
/// - diagonalDown: 对角线往下
public enum AnimationDirection {
    case horizontal
    case vertical
    case diagonalUp
    case diagonalDown
}
```

## Design

| ![](https://github.com/DevLiuSir/LCSlideToUnlock/raw/master/Screencast/horizontal.gif) | ![](https://github.com/DevLiuSir/LCSlideToUnlock/raw/master/Screencast/vertical.gif) |  ![](https://github.com/DevLiuSir/LCSlideToUnlock/raw/master/Screencast/diagonalUp.gif) |  ![](https://github.com/DevLiuSir/LCSlideToUnlock/raw/master/Screencast/diagonalDown.gif) |
| :------------: | :------------: | :------------: | :------------: |
| `horizontal` | `vertical` | `diagonalUp`  | `diagonalDown` |


## Attribute

|  Attribute name	|  Specific introduction of attributes	|
| :------------: | :------------: | 
|  `textStr `  |  LCSlideToUnlock  of  text  |
|  `textColor`	|  LCSlideToUnlock  text  color  |
|  `isEnableAutoreverses`	|  Whether to turn on and back animation  |
|  `shimmerImage`  | Gradient picture (You can only set one with `shimmerColors`) |
|  `shimmerColors`  |  The gradient color group (at least two elements, only one with `shimmerImage`)	|


## Installation

[CocoaPods](http://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:

```swift
$ gem install cocoapods
```


Just add the `LCSlideToUnlock` folder to your project.

or use `CocoaPods` with Podfile:

```swift
pod 'LCSlideToUnlock'
```

You can use CocoaPods to install `LCSlideToUnlock` by adding it to your Podfile:


```swift
platform :ios, '12.0'
target '<Your Target Name>' do
use_frameworks!
pod 'LCSlideToUnlock'
end
```



Then, run the following command:

```swift
$ pod install
```


## Example:

```swift
import UIKit
import LCSlideToUnlock

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
```
