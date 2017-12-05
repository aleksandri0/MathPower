import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    private var summary = ""
    private var screenTitle = ""
    private var answers = [PresentableAnswer]()
    
    convenience init(title: String, summary: String, answers: [PresentableAnswer]) {
        self.init()
        
        self.screenTitle = title
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = screenTitle
        headerLabel.text = summary
        
        tableView.register(CorrectAnswerCell.self)
        tableView.register(WrongAnswerCell.self)
    }
}

extension ResultsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = answers[indexPath.row]
        if answer.isCorrect {
            return correctAnswerCell(answer)
        }
        return wrongAnswerCell(answer)
    }
    
    private func correctAnswerCell(_ answer: PresentableAnswer) -> CorrectAnswerCell {
        let cell = tableView.dequeueCell(CorrectAnswerCell.self)!
        cell.configure(withCalculation: answer.calculation, answer: answer.answer)
        
        return cell
    }
    
    private func wrongAnswerCell(_ answer: PresentableAnswer) -> WrongAnswerCell {
        guard let wrongAnswer = answer.wrongAnswer else {
            fatalError("Error appears while creating wrong answer cell")
        }
        
        let cell = tableView.dequeueCell(WrongAnswerCell.self)!
        cell.configure(withCalculation: answer.calculation, correctAnswer: answer.answer, wrongAnswer: wrongAnswer)
        
        return cell
    }
}

