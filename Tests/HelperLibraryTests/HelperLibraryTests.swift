import XCTest
@testable import HelperLibrary

final class HelperLibraryTests: XCTestCase {
    func testExample() {

        let testArray = ["1", "2", "3"]
        XCTAssertTrue(testArray.containsMore(than: 2))
        XCTAssertFalse(testArray.containsFewer(than: 2))
        
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
