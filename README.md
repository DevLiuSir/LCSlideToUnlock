
![](https://github.com/ChinaHackers/LCSlideToUnlock/raw/master/Screencast/LCSlideToUnlock.png)

![Languages](https://img.shields.io/badge/language-swift-orange.svg?style=flat)
[![Swift  4.0.3](https://img.shields.io/badge/swift-4.0.3+-blue.svg?style=flat)](https://developer.apple.com/swift/)
![xcode version](https://img.shields.io/badge/xcode-9+-yellow.svg)
![build ](https://img.shields.io/appveyor/ci/gruntjs/grunt/master.svg)
![platform](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![https://github.com/ChinaHackers/LCSlideToUnlock/blob/master/LICENSE](https://img.shields.io/github/license/ChinaHackers/LCSlideToUnlock.svg)
![GitHub starts](https://img.shields.io/github/stars/ChinaHackers/LCSlideToUnlock.svg?style=social&label=Stars)
[![Twitter Follow](https://img.shields.io/twitter/follow/LiuChuan_.svg?style=social)](https://twitter.com/LiuChuan_)


## What is LCSlideToUnlock?


<p align="center"> <b>LCSlideToUnlock is a simple slide to unlock iOS UI component.</b></p> 


## Requirements

- iOS 11.2
- Xcode 9.2
- Swift 4.0.3+

## Screencast from our Demo

<div align=center> 
<img src="https://github.com/ChinaHackers/LCSlideToUnlock/raw/master/Screencast/Screencast02.png" width="300">
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

## Picture Demo

| ![](https://github.com/ChinaHackers/LCSlideToUnlock/raw/master/Screencast/horizontal.gif) | ![](https://github.com/ChinaHackers/LCSlideToUnlock/raw/master/Screencast/vertical.gif) |  ![](https://github.com/ChinaHackers/LCSlideToUnlock/raw/master/Screencast/diagonalUp.gif) |  ![](https://github.com/ChinaHackers/LCSlideToUnlock/raw/master/Screencast/diagonalDown.gif) |
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


## Example:

```swift
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
```
