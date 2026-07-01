# XcodeToolSwift

一个将 Objective-C 工具库 `xcode_tool` 转换为 Swift 的项目。提供了 Java 风格的字符串操作、Base64 编解码、调试工具和 UI 常量等功能。

## 功能特性

### String 扩展 (Java 风格 API)

- `charAt(_:)` - 获取指定索引的字符
- `compareTo(_:)` / `compareToIgnoreCase(_:)` - 字典序比较
- `contains(_:)` - 检查是否包含子串
- `startsWith(_:)` / `endsWith(_:)` - 前缀/后缀检查
- `equals(_:)` / `equalsIgnoreCase(_:)` - 字符串相等比较
- `indexOfChar(_:)` / `indexOfString(_:)` - 查找字符/子串索引
- `lastIndexOfChar(_:)` / `lastIndexOfString(_:)` - 反向查找
- `substring(from:to:)` - 子串提取
- `toLowerCase()` / `toUpperCase()` - 大小写转换
- `trim()` - 去除首尾空白
- `replaceAll(_:with:)` - 替换所有匹配
- `split(_:)` - 按分隔符分割

### Data 扩展 (Base64 编解码)

- `Data.fromBase64String(_:)` - 从 Base64 字符串解码
- `base64EncodedString(separateLines:)` - 编码为 Base64 字符串
- `String.base64Encoded()` / `String.base64Decoded()` - 字符串的 Base64 编解码

### 工具函数

- `debugLog(_:)` - 仅在 DEBUG 模式下输出日志
- `debugMethod()` - 输出当前方法名
- `STR(_:)` - 本地化字符串简写
- `RGB(_:_:_:)` - 从 RGB 值创建颜色
- `colorFromHex(_:)` - 从十六进制值创建颜色

### 路径工具

- `pathOfAppHome` - 应用主目录
- `pathOfDocument` - 文档目录
- `pathOfCache` - 缓存目录
- `pathOfTemp` - 临时目录

### UI 常量

- `UIConstants.navigationBarHeight` - 导航栏高度
- `UIConstants.tabBarHeight` - Tab 栏高度
- `UIConstants.screenWidth` / `screenHeight` - 屏幕尺寸
- `UIConstants.safeAreaTop` / `safeAreaBottom` - 安全区域

### 系统版本比较

- `SystemVersion.greaterThan(_:)` - 版本大于
- `SystemVersion.greaterThanOrEqualTo(_:)` - 版本大于等于
- `SystemVersion.lessThan(_:)` - 版本小于
- `SystemVersion.lessThanOrEqualTo(_:)` - 版本小于等于
- `SystemVersion.equalTo(_:)` - 版本等于

## 安装

### Swift Package Manager

在 `Package.swift` 中添加依赖:

```swift
dependencies: [
    .package(url: "https://github.com/your-repo/XcodeToolSwift.git", from: "1.0.0")
]
```

或在 Xcode 中通过 File > Add Package Dependencies 添加。

## 使用示例

### 字符串操作

```swift
import XcodeToolSwift

let str = "Hello, World!"

// 获取字符
let char = str.charAt(0) // "H"

// 查找子串
let index = str.indexOfString("World") // 7

// 去除空白
let trimmed = "  text  ".trim() // "text"

// 分割字符串
let parts = "a,b,c".split(",") // ["a", "b", "c"]

// 大小写转换
let upper = "hello".toUpperCase() // "HELLO"
```

### Base64 编解码

```swift
import XcodeToolSwift

// 编码
let data = "Hello".data(using: .utf8)!
let encoded = data.base64EncodedString(separateLines: false) // "SGVsbG8="

// 解码
let decoded = Data.fromBase64String("SGVsbG8=")
let str = String(data: decoded!, encoding: .utf8) // "Hello"
```

### 系统版本检查

```swift
import XcodeToolSwift

if SystemVersion.greaterThanOrEqualTo("14.0") {
    // iOS 14+ 特定代码
}

if systemVersionLessThan("15.0") {
    // iOS 15 以下的兼容代码
}
```

### 调试日志

```swift
import XcodeToolSwift

// 仅在 DEBUG 模式下输出
debugLog("User logged in:", username)
debugMethod() // 输出当前函数名
```

## 平台支持

- iOS 13.0+
- macOS 10.15+
- tvOS 13.0+
- watchOS 6.0+

## 许可证

本项目基于原始 xcode_tool 项目转换而来。
- NSStringWrapper: Copyright (c) 2012 Tang Qiao (blog.devtang.com)
- NSData+Base64: Copyright 2009 Matt Gallagher

## 原始项目

本项目是以下 Objective-C 组件的 Swift 版本:
- NSStringWrapper - Java 风格的 NSString 扩展
- NSData+Base64 - Base64 编解码
- MacroUtils - 调试和工具宏
- UIConstants - UI 常量
- VersionCompare - 系统版本比较宏
