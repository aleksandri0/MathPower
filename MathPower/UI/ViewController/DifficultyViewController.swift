import UIKit

class DifficultyViewController: UIViewController {
    
    private(set) var difficulties = [String]()
    private var screenTitle = ""
    convenience init(difficulties: [String], title: String) {
        self.init()
        self.difficulties = difficulties
        self.screenTitle = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = screenTitle
    }
    
}
