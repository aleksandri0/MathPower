import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    private var summary = ""
    private var screenTitle = ""
    
    convenience init(title: String, summary: String) {
        self.init()
        
        self.screenTitle = title
        self.summary = summary
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = screenTitle
        headerLabel.text = summary
    }
    
}
