import XCTest
@testable import CiNiiKit

final class CiNiiKitTests: XCTestCase {
    var cinii: CiNiiKit!
    var helper: TestHelper!
    var decoder: JSONDecoder!

    override func setUp() {
        super.setUp()

        self.cinii = CiNiiKit.shared
        self.helper = TestHelper.shared
        self.decoder = JSONDecoder()
    }

    static var allTests = [
        ("testDecodeArticle", testDecodeArticle),
        ("testDecodeBooks", testDecodeBooks),
        ("testDecodeDissertations", testDecodeDissertations)
    ]
}
