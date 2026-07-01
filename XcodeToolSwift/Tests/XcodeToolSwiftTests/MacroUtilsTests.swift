//
//  MacroUtilsTests.swift
//  XcodeToolSwiftTests
//

import XCTest
@testable import XcodeToolSwift

final class MacroUtilsTests: XCTestCase {
    
    // MARK: - Path Tests
    
    func testPathOfAppHome() {
        XCTAssertFalse(pathOfAppHome.isEmpty)
        XCTAssertTrue(pathOfAppHome.hasPrefix("/"))
    }
    
    func testPathOfTemp() {
        XCTAssertFalse(pathOfTemp.isEmpty)
    }
    
    func testPathOfDocument() {
        XCTAssertFalse(pathOfDocument.isEmpty)
    }
    
    func testPathOfCache() {
        XCTAssertFalse(pathOfCache.isEmpty)
    }
    
    // MARK: - String Constants Tests
    
    func testEmptyString() {
        XCTAssertEqual(emptyString, "")
        XCTAssertTrue(emptyString.isEmpty)
    }
    
    // MARK: - Localization Tests
    
    func testSTR() {
        let key = "test_key"
        let result = STR(key)
        XCTAssertEqual(result, key)
    }
    
    // MARK: - Debug Logging Tests
    
    func testDebugLog() {
        debugLog("Test message", 123, true)
    }
    
    func testDebugMethod() {
        debugMethod()
    }
}
