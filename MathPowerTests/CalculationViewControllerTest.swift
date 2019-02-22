import Foundation
import XCTest
@testable import MathPower

class CalculationViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_rendersCorrectCalculation() {
        XCTAssertEqual(makeSUT(calculation: "1+1").calculationLabel.text, "1+1")
    }
    
    func test_viewDidLoad_rendersCorrectTitle() {
        XCTAssertEqual(makeSUT(title: "Title").title, "Title")
    }

    func test_answerEntered_answerRouted() {
        var receivedAnswer = ""
        let enteredAnswer = "1"
        
        let sut = makeSUT() { receivedAnswer = $0 }
        sut.answerTextField.setTextAndSendEvent(enteredAnswer)
        
        XCTAssertEqual(receivedAnswer, enteredAnswer)
    }
    
    func test_nilTextAnswer_emptyAnswerRouted() {
        var receivedAnswer = ""
        let sut = makeSUT() { receivedAnswer = $0 }
        sut.answerTextField.setTextAndSendEvent(nil)
        
        XCTAssertEqual(receivedAnswer, "")
    }
    
    func test_emptyTextAnswer_emptyAnswerRouted() {
        var receivedAnswer = ""
        let sut = makeSUT() { receivedAnswer = $0 }
        sut.answerTextField.setTextAndSendEvent("")
        
        XCTAssertEqual(receivedAnswer, "")
    }
    
    func test_validatorRouted() {
        let validator = AnswerValidator()
        let sut = makeSUT(validator: validator)
        
        XCTAssertEqual(sut.answerValidator, validator)
    }
    
    func makeSUT(title: String = "", calculation: String = "", navigationButtonTitle: String = "", validator: AnswerValidator = AnswerValidator(), submitAnswerCallback: @escaping (String) -> Void = { _ in }) -> CalculationViewController {
        let sut = CalculationViewController(title: title, calculation: calculation, navigationButtonTitle: navigationButtonTitle, validator: validator, submitAnswerCallback: submitAnswerCallback)
        _ = sut.view
        
        return sut
    }
    
}

extension UITextField {
    func setTextAndSendEvent(_ text: String?) {
        self.text = text
        sendActions(for: .editingChanged)
    }
}
