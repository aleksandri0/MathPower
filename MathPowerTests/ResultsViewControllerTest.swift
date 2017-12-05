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
    
    func test_viewDidLoad_rendersAnswers() {
        XCTAssertEqual(makeSUT(answers: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(answers: [makeDummyAnswer()]).tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_oneAnswer_rendersCorrectAnswerCell() {
        let sut = makeSUT(answers: [makeDummyAnswer(isCorrect: true)])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        
        XCTAssertNotNil(cell)
    }
    
    func test_viewDidLoad_oneAnswer_rendersWrongAnswerCell() {
        let sut = makeSUT(answers: [makeDummyAnswer(isCorrect: false)])
        let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        
        XCTAssertNotNil(cell)
    }
    
    func makeSUT(
        title: String = "",
        summary: String = "",
        answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(title: title, summary: summary, answers: answers)
        _ = sut.view
        
        return sut
    }
    
    func makeDummyAnswer(isCorrect: Bool = true) -> PresentableAnswer {
        return PresentableAnswer(isCorrect: isCorrect)
    }
    
}

extension UITableView {
    
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
}






