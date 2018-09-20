import UIKit

class CorrectAnswerCell: UITableViewCell {
    
    @IBOutlet weak var label: ResultLabel!
    
    func configure(withCalculation calculation: String, answer: String) {
        label.configure(withCalculation: calculation, answer: answer, wrongAnswer: nil)
    }
    
}
