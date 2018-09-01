import XCTest
@testable import CiNiiKit

final class CiNiiKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let cinii = CiNiiKit.shared
        XCTAssertEqual(cinii.text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
