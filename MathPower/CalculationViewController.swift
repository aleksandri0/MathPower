import UIKit

class CalculationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    private var calculation = ""
    private var screnTitle = ""
    private var navigationButtonTitle = ""
    private(set) var submitAnswerCallback: ((String) -> Void)? = nil
    
    convenience init(title: String, calculation: String, navigationButtonTitle: String, submitAnswerCallback: @escaping (String) -> Void) {
        self.init()
        self.screnTitle = title
        self.calculation = calculation
        self.navigationButtonTitle = navigationButtonTitle
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
        submitAnswerCallback?(textField.text ?? "")
    }

    
}
