import UIKit

class ResultLabel: UILabel {
    
    private(set) var calculation: String?
    private(set) var answer: String?
    private(set) var wrongAnswer: String?
    
    func configure(withCalculation calculation: String, answer: String, wrongAnswer: String?) {
        self.calculation = calculation
        self.answer = answer
        self.wrongAnswer = wrongAnswer
        
        let attributedString = NSMutableAttributedString(string: calculation + " = ")
        attributedString.insert(answer, color: UIColor.green)
        
        if let wrongAnswer = wrongAnswer {
            attributedString.insert("(")
            attributedString.insert(wrongAnswer, color: UIColor.red)
            attributedString.insert(")")
        }
        
        attributedText = attributedString
    }
    
}

extension NSMutableAttributedString {
    
    func insert(_ string:String) {
        insert(NSAttributedString(string: string), at: length)
    }
    
    func insert(_ string: String, color: UIColor) {
        let attributedString = NSAttributedString(
            string: string,
            attributes: [NSAttributedStringKey.foregroundColor : color])
        insert(attributedString, at: length)
    }
}




