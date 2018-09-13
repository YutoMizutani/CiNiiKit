import XCTest
@testable import CiNiiKit

final class CiNiiKitTests: XCTestCase {
    let helper = TestHelper.shared
    let decoder = JSONDecoder()

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let cinii = CiNiiKit.shared
        XCTAssertEqual(cinii.text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
        ("testDecodeArticle", testDecodeArticle),
        ("testDecodeBooks", testDecodeBooks),
        ("testDecodeDissertations", testDecodeDissertations)
    ]
}
