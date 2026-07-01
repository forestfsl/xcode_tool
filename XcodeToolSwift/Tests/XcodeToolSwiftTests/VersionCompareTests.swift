//
//  VersionCompareTests.swift
//  XcodeToolSwiftTests
//

import XCTest
@testable import XcodeToolSwift

final class VersionCompareTests: XCTestCase {
    
    // MARK: - SystemVersion Tests
    
    func testCurrentVersion() {
        let version = SystemVersion.current
        XCTAssertFalse(version.isEmpty)
        XCTAssertTrue(version.contains("."))
    }
    
    func testVersionComparison() {
        XCTAssertEqual(SystemVersion.compare(to: "0.0"), .orderedDescending)
        
        XCTAssertTrue(SystemVersion.greaterThan("0.0"))
        XCTAssertTrue(SystemVersion.greaterThanOrEqualTo("0.0"))
        
        XCTAssertFalse(SystemVersion.lessThan("0.0"))
        XCTAssertFalse(SystemVersion.lessThanOrEqualTo("0.0"))
        
        XCTAssertTrue(SystemVersion.lessThan("99.0"))
        XCTAssertTrue(SystemVersion.lessThanOrEqualTo("99.0"))
        
        XCTAssertFalse(SystemVersion.greaterThan("99.0"))
        XCTAssertFalse(SystemVersion.greaterThanOrEqualTo("99.0"))
    }
    
    // MARK: - Convenience Functions Tests
    
    func testSystemVersionGreaterThan() {
        XCTAssertTrue(systemVersionGreaterThan("0.0"))
        XCTAssertFalse(systemVersionGreaterThan("99.0"))
    }
    
    func testSystemVersionGreaterThanOrEqualTo() {
        XCTAssertTrue(systemVersionGreaterThanOrEqualTo("0.0"))
        XCTAssertFalse(systemVersionGreaterThanOrEqualTo("99.0"))
    }
    
    func testSystemVersionLessThan() {
        XCTAssertFalse(systemVersionLessThan("0.0"))
        XCTAssertTrue(systemVersionLessThan("99.0"))
    }
    
    func testSystemVersionLessThanOrEqualTo() {
        XCTAssertFalse(systemVersionLessThanOrEqualTo("0.0"))
        XCTAssertTrue(systemVersionLessThanOrEqualTo("99.0"))
    }
}
