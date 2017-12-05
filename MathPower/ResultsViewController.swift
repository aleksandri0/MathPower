import UIKit

struct PresentableAnswer {
    let calculation: String
    let answer: String
    let wrongAnswer: String?
    
    var isCorrect: Bool {
        return wrongAnswer == nil
    }
}

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
        
        tableView.register(
            UINib(nibName: "CorrectAnswerCell", bundle: Bundle.main),
            forCellReuseIdentifier: "CorrectAnswerCell")
        tableView.register(
            UINib(nibName: "WrongAnswerCell", bundle: Bundle.main),
            forCellReuseIdentifier: "WrongAnswerCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CorrectAnswerCell") as! CorrectAnswerCell
        cell.configure(withCalculation: answer.calculation, answer: answer.answer)
        
        return cell
    }
    
    private func wrongAnswerCell(_ answer: PresentableAnswer) -> WrongAnswerCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WrongAnswerCell") as? WrongAnswerCell,
            let wrongAnswer = answer.wrongAnswer else {
                fatalError("Error appears while creating wrong answer cell")
        }
        
        cell.configure(withCalculation: answer.calculation, correctAnswer: answer.answer, wrongAnswer: wrongAnswer)
        
        return cell
    }
    
    
    
    
}
