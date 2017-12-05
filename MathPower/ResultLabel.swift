import UIKit

class ResultLabel: UILabel {
    
    private(set) var calculation: String?
    private(set) var answer: String?
    private(set) var wrongAnswer: String?
    
    func configure(withCalculation calculation: String, answer: String, wrongAnswer: String?) {
        self.calculation = calculation
        self.answer = answer
        self.wrongAnswer = wrongAnswer
    }
    
}
