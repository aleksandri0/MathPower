import Foundation
import XCTest
@testable import MathPower

class AnswerValidatorTest: XCTestCase {
    
    func test_invalidAnswers_returnsInvalidResults() {
        XCTAssertEqual(AnswerValidator().isValid("A1"), AnswerType.notValid)
        XCTAssertEqual(AnswerValidator().isValid(""), AnswerType.notValid)
        XCTAssertEqual(AnswerValidator().isValid("1.1a"), AnswerType.notValid)
    }
    
    func test_notEquals_validAndNotValidResultsDoNotEqual() {
        XCTAssertNotEqual(AnswerValidator().isValid("1"), AnswerType.notValid)
    }
    
    func test_validAnswers_returnsValidResults() {
        XCTAssertEqual(AnswerValidator().isValid("1"), AnswerType.valid("1"))
        XCTAssertEqual(AnswerValidator().isValid("0"), AnswerType.valid("0"))
        XCTAssertEqual(AnswerValidator().isValid("-10"), AnswerType.valid("-10"))
        XCTAssertEqual(AnswerValidator().isValid("-105.24"), AnswerType.valid("-105.24"))
    }
    
}
