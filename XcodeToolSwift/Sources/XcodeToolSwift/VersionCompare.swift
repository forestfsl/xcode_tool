//
//  VersionCompare.swift
//  XcodeToolSwift
//
//  Converted from VersionCompare.h by Tang Qiao
//  Original: Copyright 2012 blog.devtang.com. All rights reserved.
//  Inspired from: http://stackoverflow.com/questions/3339722/check-iphone-ios-version
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

// MARK: - System Version Comparison

public enum SystemVersion {
    
    #if canImport(UIKit)
    /// The current system version string
    public static var current: String {
        return UIDevice.current.systemVersion
    }
    #else
    /// The current system version string (macOS)
    public static var current: String {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        return "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
    }
    #endif
    
    /// Compares the current system version to the given version
    /// - Parameter version: Version string to compare (e.g., "14.0")
    /// - Returns: ComparisonResult
    public static func compare(to version: String) -> ComparisonResult {
        return current.compare(version, options: .numeric)
    }
    
    /// Returns true if the current system version equals the given version
    /// - Parameter version: Version string to compare
    public static func equalTo(_ version: String) -> Bool {
        return compare(to: version) == .orderedSame
    }
    
    /// Returns true if the current system version is greater than the given version
    /// - Parameter version: Version string to compare
    public static func greaterThan(_ version: String) -> Bool {
        return compare(to: version) == .orderedDescending
    }
    
    /// Returns true if the current system version is greater than or equal to the given version
    /// - Parameter version: Version string to compare
    public static func greaterThanOrEqualTo(_ version: String) -> Bool {
        return compare(to: version) != .orderedAscending
    }
    
    /// Returns true if the current system version is less than the given version
    /// - Parameter version: Version string to compare
    public static func lessThan(_ version: String) -> Bool {
        return compare(to: version) == .orderedAscending
    }
    
    /// Returns true if the current system version is less than or equal to the given version
    /// - Parameter version: Version string to compare
    public static func lessThanOrEqualTo(_ version: String) -> Bool {
        return compare(to: version) != .orderedDescending
    }
}

// MARK: - Convenience Functions

/// Returns true if the current system version equals the given version
public func systemVersionEqualTo(_ version: String) -> Bool {
    return SystemVersion.equalTo(version)
}

/// Returns true if the current system version is greater than the given version
public func systemVersionGreaterThan(_ version: String) -> Bool {
    return SystemVersion.greaterThan(version)
}

/// Returns true if the current system version is greater than or equal to the given version
public func systemVersionGreaterThanOrEqualTo(_ version: String) -> Bool {
    return SystemVersion.greaterThanOrEqualTo(version)
}

/// Returns true if the current system version is less than the given version
public func systemVersionLessThan(_ version: String) -> Bool {
    return SystemVersion.lessThan(version)
}

/// Returns true if the current system version is less than or equal to the given version
public func systemVersionLessThanOrEqualTo(_ version: String) -> Bool {
    return SystemVersion.lessThanOrEqualTo(version)
}
