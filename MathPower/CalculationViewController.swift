import UIKit

enum AnswerType: Equatable {
    case valid(String)
    case notValid
    
    public static func ==(lhs: AnswerType, rhs: AnswerType) -> Bool {
        switch (lhs, rhs) {
        case (.valid(let a), .valid(let b)):
            return a == b
        case (.notValid, .notValid):
            return true
        default:
            return false
        }
    }
}

class AnswerValidator: Equatable {
    func isValid(_ answer: String?) -> AnswerType {
        guard let answer = answer else {
            return .notValid
        }
        let valid = !answer.isEmpty && answer.range(of: "[^0-9.-]", options: .regularExpression) == nil
        return valid ? .valid(answer) : .notValid
    }
    
    static func ==(lhs: AnswerValidator, rhs: AnswerValidator) -> Bool {
        return lhs === rhs
    }
}

class CalculationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    private var calculation = ""
    private var screnTitle = ""
    private var navigationButtonTitle = ""
    private(set) var submitAnswerCallback: ((String) -> Void)? = nil
    private(set) var answerValidator = AnswerValidator()
    
    convenience init(title: String, calculation: String, navigationButtonTitle: String, validator: AnswerValidator, submitAnswerCallback: @escaping (String) -> Void) {
        self.init()
        self.screnTitle = title
        self.calculation = calculation
        self.navigationButtonTitle = navigationButtonTitle
        self.answerValidator = validator
        self.submitAnswerCallback = submitAnswerCallback
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculationLabel.text = calculation
        title = screnTitle
        
        answerTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        answerTextField.becomeFirstResponder()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        switch answerValidator.isValid(textField.text) {
        case .valid(let value):
            submitAnswerCallback?(value)
        case .notValid:
            submitAnswerCallback?("")
        }
    }
}
