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
    
    func test_correctResultsCell_configureCell() {
        let calculation = "1+1"
        let answer = "2"
        let sut = makeSUT(answers: [makeDummyAnswer(
            calculation: calculation,
            answer: answer,
            isCorrect: true)])
        guard let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell else {
            XCTFail("Expected non-nil correct answer cell at this point")
            return
        }
        
        XCTAssertEqual(cell.label.calculation, calculation)
        XCTAssertEqual(cell.label.answer, answer)
        XCTAssertNil(cell.label.wrongAnswer)
    }
    
    func test_wrongResultsCell_configureCell() {
        let calculation = "1+1"
        let answer = "2"
        let wrongAnswer = "3"
        let sut = makeSUT(answers: [makeDummyAnswer(
            calculation: calculation,
            answer: answer,
            wrongAnswer: wrongAnswer,
            isCorrect: false)])
        guard let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell else {
            XCTFail("Expected non-nil wrong answer cell at this point")
            return
        }
        
        XCTAssertEqual(cell.label.calculation, calculation)
        XCTAssertEqual(cell.label.answer, answer)
        XCTAssertEqual(cell.label.wrongAnswer, wrongAnswer)
    }
    
    
    func test_viewDidLoad_twoAnswers_rendersWrongAndCorrectAnswerCells() {
        let sut = makeSUT(answers: [makeDummyAnswer(isCorrect: false), makeDummyAnswer(isCorrect: true)])
        let wrongCell = sut.tableView.cell(at: 0) as? WrongAnswerCell
        let correctCell = sut.tableView.cell(at: 1) as? CorrectAnswerCell
        
        XCTAssertNotNil(wrongCell)
        XCTAssertNotNil(correctCell)
    }
    
    func makeSUT(
        title: String = "",
        summary: String = "",
        answers: [PresentableAnswer] = []) -> ResultsViewController {
        let sut = ResultsViewController(title: title, summary: summary, answers: answers)
        _ = sut.view
        
        return sut
    }
    
    func makeDummyAnswer(
        calculation: String = "",
        answer: String = "",
        wrongAnswer: String? = nil,
        isCorrect: Bool = true) -> PresentableAnswer {
        return PresentableAnswer(
            calculation: calculation,
            answer: answer,
            wrongAnswer: wrongAnswer,
            isCorrect: isCorrect)
    }
    
}

extension UITableView {
    
    func cell(at row: Int) -> UITableViewCell? {
        return dataSource?.tableView(self, cellForRowAt: IndexPath(row: row, section: 0))
    }
    
}






