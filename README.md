# CustomDarkMode

[![CI Status](https://img.shields.io/travis/liangdahong/CustomDarkMode.svg?style=flat)](https://travis-ci.org/liangdahong/CustomDarkMode)
[![Version](https://img.shields.io/cocoapods/v/CustomDarkMode.svg?style=flat)](https://cocoapods.org/pods/CustomDarkMode)
[![License](https://img.shields.io/cocoapods/l/CustomDarkMode.svg?style=flat)](https://cocoapods.org/pods/CustomDarkMode)
[![Platform](https://img.shields.io/cocoapods/p/CustomDarkMode.svg?style=flat)](https://cocoapods.org/pods/CustomDarkMode)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CustomDarkMode is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CustomTheme'
```

- 设置样式
```swift
view.theme({ view in
     // 设置样式，在模式切换时会自动触发此 block
     view.backgroundColor = (DarkModeManager.shared.currentMode == .light) ? .white : .black
})
```

- 切换模式
```swift
    @IBAction func switchClick(_ sender: UISwitch) {
        CustomThemeService.refresh()
    }
```

- 效果
- ![](https://user-images.githubusercontent.com/12118567/170068703-332a5d7f-dc3e-485e-968a-9c6ae99a44d1.gif)

## Author

liangdahong, hi@liangdahong.com

## License

CustomDarkMode is available under the MIT license. See the LICENSE file for more info.
