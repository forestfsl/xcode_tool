//
//  XcodeToolSwift.swift
//  XcodeToolSwift
//
//  A Swift port of the xcode_tool Objective-C library
//  Original by Tang Qiao - blog.devtang.com
//

/// XcodeToolSwift provides a collection of Swift utilities and extensions
/// that mirror Java-style string operations, Base64 encoding/decoding,
/// debug utilities, and UI constants.
///
/// ## Features
///
/// ### String Extensions (Java-style)
/// - `charAt(_:)` - Get character at index
/// - `compareTo(_:)` - Lexicographic comparison
/// - `contains(_:)` - Check if string contains substring
/// - `indexOf...` - Find index of character or substring
/// - `trim()` - Remove whitespace
/// - `split(_:)` - Split by separator
///
/// ### Data Extensions (Base64)
/// - `Data.fromBase64String(_:)` - Decode base64 string
/// - `base64EncodedString(separateLines:)` - Encode to base64
///
/// ### Utility Functions
/// - `debugLog(_:)` - Debug-only logging
/// - `STR(_:)` - Localization shorthand
/// - `RGB(_:_:_:)` - Color creation from RGB values
///
/// ### Constants
/// - `UIConstants` - Common UI dimension values
/// - `SystemVersion` - OS version comparison utilities
///
/// ## Example Usage
///
/// ```swift
/// // String operations
/// let str = "Hello, World!"
/// let char = str.charAt(0) // "H"
/// let index = str.indexOfString("World") // 7
/// let trimmed = "  text  ".trim() // "text"
///
/// // Base64 encoding
/// let data = "Hello".data(using: .utf8)!
/// let encoded = data.base64EncodedString()
/// let decoded = Data.fromBase64String(encoded)
///
/// // System version check
/// if SystemVersion.greaterThanOrEqualTo("14.0") {
///     // iOS 14+ specific code
/// }
/// ```

public struct XcodeToolSwift {
    /// Library version
    public static let version = "1.0.0"
    
    /// Library name
    public static let name = "XcodeToolSwift"
    
    /// Library description
    public static let description = "A Swift port of xcode_tool utilities"
}
