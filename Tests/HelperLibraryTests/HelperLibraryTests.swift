import XCTest
@testable import HelperLibrary

final class HelperLibraryTests: XCTestCase {
    func testExample() {

        let testArray = ["1", "2", "3"]
        XCTAssertTrue(testArray.containsMore(than: 2))
        XCTAssertFalse(testArray.containsFewer(than: 2))
    }
    
    func testEvenOdd() {
        XCTAssertTrue(0.isEven)
        XCTAssertTrue(2.isEven)
        XCTAssertTrue(10.isEven)
        XCTAssertTrue(28.isEven)
        
        XCTAssertTrue(1.isOdd)
        XCTAssertTrue(3.isOdd)
        XCTAssertTrue(891.isOdd)
        XCTAssertTrue(9.isOdd)
    }

    static var allTests = [
        ("testExample", testExample),
        ("testEvenOdd", testEvenOdd)
    ]
}
