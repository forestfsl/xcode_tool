//
//  StringWrapper.swift
//  XcodeToolSwift
//
//  Converted from NSStringWrapper by Tang Qiao
//  Original: Copyright (c) 2012 blog.devtang.com. All rights reserved.
//

import Foundation

public extension String {
    
    private static let javaNotFound: Int = -1
    
    /// Return the character value at the specified index.
    func charAt(_ index: Int) -> Character {
        let idx = self.index(startIndex, offsetBy: index)
        return self[idx]
    }
    
    /// Compares two strings lexicographically.
    /// - Returns: 0 if equal, negative if less than, positive if greater than
    func compareTo(_ anotherString: String) -> Int {
        return compare(anotherString).rawValue
    }
    
    /// Compares two strings lexicographically, ignoring case differences.
    func compareToIgnoreCase(_ str: String) -> Int {
        return compare(str, options: .caseInsensitive).rawValue
    }
    
    /// Returns true if and only if this string contains the specified sequence of characters.
    func contains(_ str: String) -> Bool {
        return range(of: str) != nil
    }
    
    /// Tests if this string starts with the specified prefix.
    func startsWith(_ prefix: String) -> Bool {
        return hasPrefix(prefix)
    }
    
    /// Tests if this string ends with the specified suffix.
    func endsWith(_ suffix: String) -> Bool {
        return hasSuffix(suffix)
    }
    
    /// Compares this string to the specified string.
    func equals(_ anotherString: String) -> Bool {
        return self == anotherString
    }
    
    /// Compares this String to another String, ignoring case considerations.
    func equalsIgnoreCase(_ anotherString: String) -> Bool {
        return lowercased() == anotherString.lowercased()
    }
    
    /// Returns the index within this string of the first occurrence of the specified character.
    func indexOfChar(_ ch: Character) -> Int {
        return indexOfChar(ch, fromIndex: 0)
    }
    
    /// Returns the index within this string of the first occurrence of the specified character,
    /// starting the search at the specified index.
    func indexOfChar(_ ch: Character, fromIndex: Int) -> Int {
        guard fromIndex < count else { return Self.javaNotFound }
        
        let startIdx = index(startIndex, offsetBy: fromIndex)
        if let foundIdx = self[startIdx...].firstIndex(of: ch) {
            return distance(from: startIndex, to: foundIdx)
        }
        return Self.javaNotFound
    }
    
    /// Returns the index within this string of the first occurrence of the specified substring.
    func indexOfString(_ str: String) -> Int {
        if let range = range(of: str) {
            return distance(from: startIndex, to: range.lowerBound)
        }
        return Self.javaNotFound
    }
    
    /// Returns the index within this string of the first occurrence of the specified substring,
    /// starting at the specified index.
    func indexOfString(_ str: String, fromIndex: Int) -> Int {
        guard fromIndex < count else { return Self.javaNotFound }
        
        let startIdx = index(startIndex, offsetBy: fromIndex)
        if let range = self[startIdx...].range(of: str) {
            return distance(from: startIndex, to: range.lowerBound)
        }
        return Self.javaNotFound
    }
    
    /// Returns the index within this string of the last occurrence of the specified character.
    func lastIndexOfChar(_ ch: Character) -> Int {
        if let foundIdx = lastIndex(of: ch) {
            return distance(from: startIndex, to: foundIdx)
        }
        return Self.javaNotFound
    }
    
    /// Returns the index within this string of the last occurrence of the specified character,
    /// searching backward starting at the specified index.
    func lastIndexOfChar(_ ch: Character, fromIndex: Int) -> Int {
        let effectiveIndex = min(fromIndex, count - 1)
        guard effectiveIndex >= 0 else { return Self.javaNotFound }
        
        let endIdx = index(startIndex, offsetBy: effectiveIndex + 1)
        if let foundIdx = self[..<endIdx].lastIndex(of: ch) {
            return distance(from: startIndex, to: foundIdx)
        }
        return Self.javaNotFound
    }
    
    /// Returns the index within this string of the last occurrence of the specified substring.
    func lastIndexOfString(_ str: String) -> Int {
        if let range = range(of: str, options: .backwards) {
            return distance(from: startIndex, to: range.lowerBound)
        }
        return Self.javaNotFound
    }
    
    /// Returns the index within this string of the last occurrence of the specified substring,
    /// searching backward starting at the specified index.
    func lastIndexOfString(_ str: String, fromIndex: Int) -> Int {
        guard fromIndex > 0 else { return Self.javaNotFound }
        
        let endIdx = index(startIndex, offsetBy: min(fromIndex, count))
        if let range = self[..<endIdx].range(of: str, options: .backwards) {
            return distance(from: startIndex, to: range.lowerBound)
        }
        return Self.javaNotFound
    }
    
    /// Returns a string that is a substring of this string.
    func substring(from beginIndex: Int, to endIndex: Int) -> String {
        guard endIndex > beginIndex else { return "" }
        guard beginIndex >= 0, endIndex <= count else { return "" }
        
        let start = index(startIndex, offsetBy: beginIndex)
        let end = index(startIndex, offsetBy: endIndex)
        return String(self[start..<end])
    }
    
    /// Converts all of the characters in this String to lower case.
    func toLowerCase() -> String {
        return lowercased()
    }
    
    /// Converts all of the characters in this String to upper case.
    func toUpperCase() -> String {
        return uppercased()
    }
    
    /// Returns a string whose value is this string, with any leading and trailing whitespace removed.
    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Replaces each substring of this string that matches the literal target sequence
    /// with the specified literal replacement sequence.
    func replaceAll(_ origin: String, with replacement: String) -> String {
        return replacingOccurrences(of: origin, with: replacement)
    }
    
    /// Splits this string around matches of the given separator.
    func split(_ separator: String) -> [String] {
        return components(separatedBy: separator)
    }
}
