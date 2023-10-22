import XCTest
import SwiftUI
@testable import BaseXI

final class BaseColorTests: XCTestCase {

    func testHexColors() throws {
        XCTAssertEqual(BaseColor._FF0000.uiColor, UIColor(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(BaseColor._00FF00.uiColor, UIColor(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(BaseColor._0000FF.uiColor, UIColor(red: 0, green: 0, blue: 1, alpha: 1))
        XCTAssertEqual(BaseColor._000000.uiColor, UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(BaseColor._FFFFFF.uiColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(BaseColor._00000080.uiColor, UIColor(red: 0, green: 0, blue: 0, alpha: 128.0 / 255))
        XCTAssertEqual(BaseColor._FFFFFF80.uiColor, UIColor(red: 1, green: 1, blue: 1, alpha: 128.0 / 255))

        XCTAssertEqual(BaseColor._FF0000.cgColor, CGColor(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(BaseColor._00FF00.cgColor, CGColor(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(BaseColor._0000FF.cgColor, CGColor(red: 0, green: 0, blue: 1, alpha: 1))
        XCTAssertEqual(BaseColor._000000.cgColor, CGColor(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(BaseColor._FFFFFF.cgColor, CGColor(red: 1, green: 1, blue: 1, alpha: 1))
        XCTAssertEqual(BaseColor._00000080.cgColor, CGColor(red: 0, green: 0, blue: 0, alpha: 128.0 / 255))
        XCTAssertEqual(BaseColor._FFFFFF80.cgColor, CGColor(red: 1, green: 1, blue: 1, alpha: 128.0 / 255))

        XCTAssertEqual(BaseColor._FF0000.color, Color(red: 1, green: 0, blue: 0, opacity: 1))
        XCTAssertEqual(BaseColor._00FF00.color, Color(red: 0, green: 1, blue: 0, opacity: 1))
        XCTAssertEqual(BaseColor._0000FF.color, Color(red: 0, green: 0, blue: 1, opacity: 1))
        XCTAssertEqual(BaseColor._000000.color, Color(red: 0, green: 0, blue: 0, opacity: 1))
        XCTAssertEqual(BaseColor._00000080.color, Color(red: 0, green: 0, blue: 0, opacity: 128.0 / 255))
        XCTAssertEqual(BaseColor._FFFFFF80.color, Color(red: 1, green: 1, blue: 1, opacity: 128.0 / 255))
    }
}
