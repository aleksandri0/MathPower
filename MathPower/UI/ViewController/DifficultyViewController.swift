import UIKit

class DifficultyViewController: UIViewController {
    
    private(set) var difficulties = [PresentableDifficulty]()
    private(set) var difficultiesButtons = [UIButton]()

    private var screenTitle = ""
    private var submitDifficultyCallback: (String) -> Void = { _ in }

    convenience init(difficulties: [PresentableDifficulty],
                     title: String,
                     submitDifficultyCallback: @escaping (String) -> Void ) {
        self.init()
        self.difficulties = difficulties
        self.screenTitle = title
        self.submitDifficultyCallback = submitDifficultyCallback
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = screenTitle
        difficultiesButtons = difficulties.map { difficulty in
            let button = UIButton()
            button.setTitle(difficulty.name, for: .normal)
            button.addTarget(self, action: #selector(difficultyButtonTap(_:)), for: .touchUpInside)
            return button
        }
    }
}

private extension DifficultyViewController {
    @objc func difficultyButtonTap(_ button: UIButton) {
        guard let title = button.title(for: .normal) else { return }
        submitDifficultyCallback(title)
    }
}
