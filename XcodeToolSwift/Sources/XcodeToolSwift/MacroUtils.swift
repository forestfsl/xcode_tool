//
//  MacroUtils.swift
//  XcodeToolSwift
//
//  Converted from MacroUtils.h by Tang Qiao
//  Original: Copyright 2012 blog.devtang.com. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

// MARK: - Debug Logging

/// Logs a message only in DEBUG builds
/// - Parameters:
///   - items: Items to print
///   - file: Source file name (auto-filled)
///   - function: Function name (auto-filled)
///   - line: Line number (auto-filled)
public func debugLog(
    _ items: Any...,
    file: String = #file,
    function: String = #function,
    line: Int = #line
) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    let output = items.map { "\($0)" }.joined(separator: " ")
    print("[\(fileName):\(line)] \(function) - \(output)")
    #endif
}

/// Logs the current method name only in DEBUG builds
/// - Parameters:
///   - file: Source file name (auto-filled)
///   - function: Function name (auto-filled)
///   - line: Line number (auto-filled)
public func debugMethod(
    file: String = #file,
    function: String = #function,
    line: Int = #line
) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):\(line)] \(function)")
    #endif
}

// MARK: - String Constants

public let emptyString = ""

// MARK: - Localization

/// Returns the localized string for the given key
/// - Parameter key: The localization key
/// - Returns: The localized string
public func STR(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

// MARK: - Path Utilities

/// Path to the application's home directory
public var pathOfAppHome: String {
    return NSHomeDirectory()
}

/// Path to the application's temporary directory
public var pathOfTemp: String {
    return NSTemporaryDirectory()
}

/// Path to the application's Documents directory
public var pathOfDocument: String {
    return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
}

/// Path to the application's Caches directory
public var pathOfCache: String {
    return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first ?? ""
}

// MARK: - App Information

/// The application's version string
public var appVersion: String {
    return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
}

/// The application's build number
public var appBuildNumber: String {
    return Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
}

/// The application's bundle identifier
public var appBundleIdentifier: String {
    return Bundle.main.bundleIdentifier ?? ""
}

// MARK: - Color Utilities

#if canImport(UIKit)
/// Creates a UIColor from RGB values (0-255)
/// - Parameters:
///   - r: Red component (0-255)
///   - g: Green component (0-255)
///   - b: Blue component (0-255)
///   - alpha: Alpha component (0.0-1.0), defaults to 1.0
/// - Returns: A UIColor instance
public func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
}

/// Creates a UIColor from a hex value
/// - Parameters:
///   - hex: The hex color value (e.g., 0xFF5733)
///   - alpha: Alpha component (0.0-1.0), defaults to 1.0
/// - Returns: A UIColor instance
public func colorFromHex(_ hex: UInt32, alpha: CGFloat = 1.0) -> UIColor {
    let r = CGFloat((hex >> 16) & 0xFF)
    let g = CGFloat((hex >> 8) & 0xFF)
    let b = CGFloat(hex & 0xFF)
    return RGB(r, g, b, alpha: alpha)
}
#endif

#if canImport(AppKit) && !targetEnvironment(macCatalyst)
import AppKit

/// Creates an NSColor from RGB values (0-255) on macOS
/// - Parameters:
///   - r: Red component (0-255)
///   - g: Green component (0-255)
///   - b: Blue component (0-255)
///   - alpha: Alpha component (0.0-1.0), defaults to 1.0
/// - Returns: An NSColor instance
public func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, alpha: CGFloat = 1.0) -> NSColor {
    return NSColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
}

/// Creates an NSColor from a hex value on macOS
/// - Parameters:
///   - hex: The hex color value (e.g., 0xFF5733)
///   - alpha: Alpha component (0.0-1.0), defaults to 1.0
/// - Returns: An NSColor instance
public func colorFromHex(_ hex: UInt32, alpha: CGFloat = 1.0) -> NSColor {
    let r = CGFloat((hex >> 16) & 0xFF)
    let g = CGFloat((hex >> 8) & 0xFF)
    let b = CGFloat(hex & 0xFF)
    return RGB(r, g, b, alpha: alpha)
}
#endif
