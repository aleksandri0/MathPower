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
    
    func test_viewDidLoad_noAnswers_rendersAnswers() {        
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(answers: ["1"]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    
    
    func makeSUT(
        title: String = "",
        summary: String = "",
        answers: [String] = []) -> ResultsViewController {
        let sut = ResultsViewController(title: title, summary: summary, answers: answers)
        _ = sut.view
        
        return sut
    }
    
}
