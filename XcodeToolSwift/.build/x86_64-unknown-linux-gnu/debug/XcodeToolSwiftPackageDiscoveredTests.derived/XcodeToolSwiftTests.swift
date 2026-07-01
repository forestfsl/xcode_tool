import XCTest
@testable import XcodeToolSwiftTests

fileprivate extension DataBase64Tests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__DataBase64Tests = [
        ("testBase64Decode", testBase64Decode),
        ("testBase64Encode", testBase64Encode),
        ("testBase64RoundTrip", testBase64RoundTrip),
        ("testBase64WithSeparateLines", testBase64WithSeparateLines),
        ("testBase64WithoutSeparateLines", testBase64WithoutSeparateLines),
        ("testEmptyBase64", testEmptyBase64),
        ("testInvalidBase64", testInvalidBase64),
        ("testStringBase64Decode", testStringBase64Decode),
        ("testStringBase64Encode", testStringBase64Encode)
    ]
}

fileprivate extension MacroUtilsTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__MacroUtilsTests = [
        ("testDebugLog", testDebugLog),
        ("testDebugMethod", testDebugMethod),
        ("testEmptyString", testEmptyString),
        ("testPathOfAppHome", testPathOfAppHome),
        ("testPathOfCache", testPathOfCache),
        ("testPathOfDocument", testPathOfDocument),
        ("testPathOfTemp", testPathOfTemp),
        ("testSTR", testSTR)
    ]
}

fileprivate extension StringWrapperTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__StringWrapperTests = [
        ("testCharAt", testCharAt),
        ("testCompareTo", testCompareTo),
        ("testCompareToIgnoreCase", testCompareToIgnoreCase),
        ("testContains", testContains),
        ("testEndsWith", testEndsWith),
        ("testEquals", testEquals),
        ("testEqualsIgnoreCase", testEqualsIgnoreCase),
        ("testIndexOfChar", testIndexOfChar),
        ("testIndexOfCharFromIndex", testIndexOfCharFromIndex),
        ("testIndexOfString", testIndexOfString),
        ("testIndexOfStringFromIndex", testIndexOfStringFromIndex),
        ("testLastIndexOfChar", testLastIndexOfChar),
        ("testLastIndexOfCharFromIndex", testLastIndexOfCharFromIndex),
        ("testLastIndexOfString", testLastIndexOfString),
        ("testLastIndexOfStringFromIndex", testLastIndexOfStringFromIndex),
        ("testReplaceAll", testReplaceAll),
        ("testSplit", testSplit),
        ("testStartsWith", testStartsWith),
        ("testSubstring", testSubstring),
        ("testToLowerCase", testToLowerCase),
        ("testToUpperCase", testToUpperCase),
        ("testTrim", testTrim)
    ]
}

fileprivate extension VersionCompareTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__VersionCompareTests = [
        ("testCurrentVersion", testCurrentVersion),
        ("testSystemVersionGreaterThan", testSystemVersionGreaterThan),
        ("testSystemVersionGreaterThanOrEqualTo", testSystemVersionGreaterThanOrEqualTo),
        ("testSystemVersionLessThan", testSystemVersionLessThan),
        ("testSystemVersionLessThanOrEqualTo", testSystemVersionLessThanOrEqualTo),
        ("testVersionComparison", testVersionComparison)
    ]
}
@available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
func __XcodeToolSwiftTests__allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DataBase64Tests.__allTests__DataBase64Tests),
        testCase(MacroUtilsTests.__allTests__MacroUtilsTests),
        testCase(StringWrapperTests.__allTests__StringWrapperTests),
        testCase(VersionCompareTests.__allTests__VersionCompareTests)
    ]
}