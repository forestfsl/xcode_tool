//
//  DataBase64Tests.swift
//  XcodeToolSwiftTests
//

import XCTest
@testable import XcodeToolSwift

final class DataBase64Tests: XCTestCase {
    
    // MARK: - Data Base64 Tests
    
    func testBase64Encode() {
        let data = "Hello, World!".data(using: .utf8)!
        let encoded = data.base64Encoded(options: [])
        XCTAssertEqual(encoded, "SGVsbG8sIFdvcmxkIQ==")
    }
    
    func testBase64Decode() {
        let decoded = Data.fromBase64String("SGVsbG8sIFdvcmxkIQ==")
        XCTAssertNotNil(decoded)
        let str = String(data: decoded!, encoding: .utf8)
        XCTAssertEqual(str, "Hello, World!")
    }
    
    func testBase64RoundTrip() {
        let original = "The quick brown fox jumps over the lazy dog"
        let data = original.data(using: .utf8)!
        let encoded = data.base64Encoded(options: [])
        let decoded = Data.fromBase64String(encoded)
        XCTAssertNotNil(decoded)
        let result = String(data: decoded!, encoding: .utf8)
        XCTAssertEqual(result, original)
    }
    
    func testBase64WithSeparateLines() {
        let longString = String(repeating: "A", count: 100)
        let data = longString.data(using: .utf8)!
        let encoded = data.base64EncodedString(separateLines: true)
        XCTAssertTrue(encoded.contains("\r\n") || encoded.contains("\n"))
    }
    
    func testBase64WithoutSeparateLines() {
        let longString = String(repeating: "A", count: 100)
        let data = longString.data(using: .utf8)!
        let encoded = data.base64EncodedString(separateLines: false)
        XCTAssertFalse(encoded.contains("\n"))
    }
    
    // MARK: - String Base64 Tests
    
    func testStringBase64Encode() {
        let encoded = "Hello".base64Encoded(separateLines: false)
        XCTAssertEqual(encoded, "SGVsbG8=")
    }
    
    func testStringBase64Decode() {
        let decoded = "SGVsbG8=".base64Decoded()
        XCTAssertNotNil(decoded)
        let str = String(data: decoded!, encoding: .utf8)
        XCTAssertEqual(str, "Hello")
    }
    
    func testInvalidBase64() {
        let decoded = "!!!invalid!!!".base64Decoded()
        XCTAssertNil(decoded)
    }
    
    func testEmptyBase64() {
        let encoded = "".base64Encoded(separateLines: false)
        XCTAssertEqual(encoded, "")
        
        let decoded = "".base64Decoded()
        XCTAssertNotNil(decoded)
        XCTAssertEqual(decoded?.count, 0)
    }
}
