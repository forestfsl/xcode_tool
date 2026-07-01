//
//  StringWrapperTests.swift
//  XcodeToolSwiftTests
//

import XCTest
@testable import XcodeToolSwift

final class StringWrapperTests: XCTestCase {
    
    // MARK: - charAt Tests
    
    func testCharAt() {
        let str = "Hello"
        XCTAssertEqual(str.charAt(0), "H")
        XCTAssertEqual(str.charAt(1), "e")
        XCTAssertEqual(str.charAt(4), "o")
    }
    
    // MARK: - compareTo Tests
    
    func testCompareTo() {
        XCTAssertEqual("abc".compareTo("abc"), 0)
        XCTAssertTrue("abc".compareTo("abd") < 0)
        XCTAssertTrue("abd".compareTo("abc") > 0)
    }
    
    func testCompareToIgnoreCase() {
        XCTAssertEqual("ABC".compareToIgnoreCase("abc"), 0)
        XCTAssertEqual("abc".compareToIgnoreCase("ABC"), 0)
    }
    
    // MARK: - contains Tests
    
    func testContains() {
        let str = "Hello, World!"
        XCTAssertTrue(str.contains("Hello"))
        XCTAssertTrue(str.contains("World"))
        XCTAssertFalse(str.contains("Swift"))
    }
    
    // MARK: - startsWith / endsWith Tests
    
    func testStartsWith() {
        let str = "Hello, World!"
        XCTAssertTrue(str.startsWith("Hello"))
        XCTAssertFalse(str.startsWith("World"))
    }
    
    func testEndsWith() {
        let str = "Hello, World!"
        XCTAssertTrue(str.endsWith("!"))
        XCTAssertTrue(str.endsWith("World!"))
        XCTAssertFalse(str.endsWith("Hello"))
    }
    
    // MARK: - equals Tests
    
    func testEquals() {
        XCTAssertTrue("Hello".equals("Hello"))
        XCTAssertFalse("Hello".equals("hello"))
    }
    
    func testEqualsIgnoreCase() {
        XCTAssertTrue("Hello".equalsIgnoreCase("hello"))
        XCTAssertTrue("HELLO".equalsIgnoreCase("hello"))
        XCTAssertFalse("Hello".equalsIgnoreCase("World"))
    }
    
    // MARK: - indexOf Tests
    
    func testIndexOfChar() {
        let str = "Hello"
        XCTAssertEqual(str.indexOfChar("H"), 0)
        XCTAssertEqual(str.indexOfChar("l"), 2)
        XCTAssertEqual(str.indexOfChar("o"), 4)
        XCTAssertEqual(str.indexOfChar("z"), -1)
    }
    
    func testIndexOfCharFromIndex() {
        let str = "Hello"
        XCTAssertEqual(str.indexOfChar("l", fromIndex: 0), 2)
        XCTAssertEqual(str.indexOfChar("l", fromIndex: 3), 3)
        XCTAssertEqual(str.indexOfChar("l", fromIndex: 4), -1)
    }
    
    func testIndexOfString() {
        let str = "Hello, World!"
        XCTAssertEqual(str.indexOfString("Hello"), 0)
        XCTAssertEqual(str.indexOfString("World"), 7)
        XCTAssertEqual(str.indexOfString("Swift"), -1)
    }
    
    func testIndexOfStringFromIndex() {
        let str = "Hello, Hello!"
        XCTAssertEqual(str.indexOfString("Hello", fromIndex: 0), 0)
        XCTAssertEqual(str.indexOfString("Hello", fromIndex: 1), 7)
    }
    
    // MARK: - lastIndexOf Tests
    
    func testLastIndexOfChar() {
        let str = "Hello"
        XCTAssertEqual(str.lastIndexOfChar("l"), 3)
        XCTAssertEqual(str.lastIndexOfChar("H"), 0)
        XCTAssertEqual(str.lastIndexOfChar("z"), -1)
    }
    
    func testLastIndexOfCharFromIndex() {
        let str = "Hello"
        XCTAssertEqual(str.lastIndexOfChar("l", fromIndex: 3), 3)
        XCTAssertEqual(str.lastIndexOfChar("l", fromIndex: 2), 2)
    }
    
    func testLastIndexOfString() {
        let str = "Hello, Hello!"
        XCTAssertEqual(str.lastIndexOfString("Hello"), 7)
        XCTAssertEqual(str.lastIndexOfString("Swift"), -1)
    }
    
    func testLastIndexOfStringFromIndex() {
        let str = "Hello, Hello, Hello!"
        XCTAssertEqual(str.lastIndexOfString("Hello", fromIndex: 13), 7)
    }
    
    // MARK: - substring Tests
    
    func testSubstring() {
        let str = "Hello, World!"
        XCTAssertEqual(str.substring(from: 0, to: 5), "Hello")
        XCTAssertEqual(str.substring(from: 7, to: 12), "World")
        XCTAssertEqual(str.substring(from: 5, to: 5), "")
        XCTAssertEqual(str.substring(from: 5, to: 3), "")
    }
    
    // MARK: - Case Conversion Tests
    
    func testToLowerCase() {
        XCTAssertEqual("HELLO".toLowerCase(), "hello")
        XCTAssertEqual("Hello World".toLowerCase(), "hello world")
    }
    
    func testToUpperCase() {
        XCTAssertEqual("hello".toUpperCase(), "HELLO")
        XCTAssertEqual("Hello World".toUpperCase(), "HELLO WORLD")
    }
    
    // MARK: - trim Tests
    
    func testTrim() {
        XCTAssertEqual("  Hello  ".trim(), "Hello")
        XCTAssertEqual("\n\tHello\n\t".trim(), "Hello")
        XCTAssertEqual("Hello".trim(), "Hello")
    }
    
    // MARK: - replaceAll Tests
    
    func testReplaceAll() {
        XCTAssertEqual("Hello, World!".replaceAll("World", with: "Swift"), "Hello, Swift!")
        XCTAssertEqual("aaa".replaceAll("a", with: "b"), "bbb")
    }
    
    // MARK: - split Tests
    
    func testSplit() {
        let str = "a,b,c,d"
        let parts = str.split(",")
        XCTAssertEqual(parts.count, 4)
        XCTAssertEqual(parts[0], "a")
        XCTAssertEqual(parts[3], "d")
    }
}
