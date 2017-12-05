import UIKit

class WrongAnswerCell: UITableViewCell {
    
    @IBOutlet weak var label: ResultLabel!
    
    func configure(withCalculation calculation: String, correctAnswer: String, wrongAnswer: String) {
        label.configure(withCalculation: calculation, answer: correctAnswer, wrongAnswer: wrongAnswer)
    }
    
}
