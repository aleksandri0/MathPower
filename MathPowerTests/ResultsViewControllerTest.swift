import Foundation
import XCTest
@testable import MathPower

class ResultsViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_rendersSummary() {
        XCTAssertEqual(makeSUT(summary: "a summary").headerLabel.text, "a summary")
    }
    
    func test_viewDidLoad_rendersTitle() {
        XCTAssertEqual(makeSUT(title: "Result").title, "Result")
    }
    
    func makeSUT(title: String = "", summary: String = "") -> ResultsViewController {
        let sut = ResultsViewController(title: title, summary: summary)
        _ = sut.view
        
        return sut
    }
    
}
