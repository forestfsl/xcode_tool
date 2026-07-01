//
//  DataBase64.swift
//  XcodeToolSwift
//
//  Converted from NSData+Base64 by Matt Gallagher
//  Original: Copyright 2009 Matt Gallagher. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

import Foundation

public extension Data {
    
    /// Creates a Data object containing the base64 decoded representation of the base64 string.
    /// - Parameter base64String: The base64 string to decode
    /// - Returns: The decoded Data, or nil if decoding fails
    static func fromBase64String(_ base64String: String) -> Data? {
        return Data(base64Encoded: base64String, options: .ignoreUnknownCharacters)
    }
    
    /// Creates a base64 encoded string from the data.
    /// - Parameter separateLines: If true, inserts line breaks every 64 characters (matching original behavior)
    /// - Returns: The base64 encoded string
    func base64EncodedString(separateLines: Bool = true) -> String {
        let options: Data.Base64EncodingOptions = separateLines ? .lineLength64Characters : []
        return base64Encoded(options: options)
    }
    
    /// Creates a base64 encoded string from the data with specified options.
    /// - Parameter options: The encoding options
    /// - Returns: The base64 encoded string
    func base64Encoded(options: Data.Base64EncodingOptions = []) -> String {
        return base64EncodedString(options: options)
    }
}

public extension String {
    
    /// Creates a Data object from this base64-encoded string.
    /// - Returns: The decoded Data, or nil if this string is not valid base64
    func base64Decoded() -> Data? {
        return Data.fromBase64String(self)
    }
    
    /// Creates a base64-encoded string from this string's UTF-8 representation.
    /// - Parameter separateLines: If true, inserts line breaks every 64 characters
    /// - Returns: The base64-encoded string, or nil if encoding fails
    func base64Encoded(separateLines: Bool = false) -> String? {
        guard let data = self.data(using: .utf8) else { return nil }
        return data.base64EncodedString(separateLines: separateLines)
    }
}
