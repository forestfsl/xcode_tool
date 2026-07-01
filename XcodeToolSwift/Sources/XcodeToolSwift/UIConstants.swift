//
//  UIConstants.swift
//  XcodeToolSwift
//
//  Converted from UIConstants.h by Tang Qiao
//  Original: Copyright 2012 blog.devtang.com. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

// MARK: - UI Constants

public enum UIConstants {
    /// Standard navigation bar height
    public static let navigationBarHeight: CGFloat = 44
    
    /// Standard tab bar height
    public static let tabBarHeight: CGFloat = 49
    
    /// Standard status bar height (legacy, pre-notch devices)
    public static let statusBarHeight: CGFloat = 20
    
    /// Legacy screen width (iPhone 4/5 era)
    public static let legacyScreenWidth: CGFloat = 320
    
    /// Legacy screen height (iPhone 4 era)
    public static let legacyScreenHeight: CGFloat = 480
    
    /// Standard label length
    public static let labelLength: CGFloat = 200
    
    /// Standard label height
    public static let labelHeight: CGFloat = 15
    
    /// Standard label font size
    public static let labelFontSize: CGFloat = 12
    
    #if canImport(UIKit)
    /// Standard label font
    public static var labelFont: UIFont {
        return UIFont.systemFont(ofSize: labelFontSize)
    }
    
    /// Current screen width
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Current screen height
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// Current safe area top inset
    @available(iOS 11.0, *)
    public static var safeAreaTop: CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            return window.safeAreaInsets.top
        }
        return 0
    }
    
    /// Current safe area bottom inset
    @available(iOS 11.0, *)
    public static var safeAreaBottom: CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            return window.safeAreaInsets.bottom
        }
        return 0
    }
    #endif
}
