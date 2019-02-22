import XCTest
import MathPowerLogic
@testable import MathPower

class DifficultyViewControllerTest: XCTestCase {
    func test_viewDidLoad_noDifficulties_NoDifficultyRouted() {
        XCTAssertEqual(makeSUT(difficulties: []).difficulties, [])
    }
    
    func test_viewDidLoad_threeDifficulties_threeDifficultiesRouted() {
        let difficulties = ["Easy", "Medium", "Hard"]
        XCTAssertEqual(makeSUT(difficulties: difficulties).difficulties, difficulties)
    }
    
    func test_viewDidLoad_titleRouted() {
        let title = "Select difficulty"
        XCTAssertEqual(makeSUT(title: title).title, title)
    }

    func test_viewDidLoad_NoDifficultyButtonCreated() {
        let sut = makeSUT()
        XCTAssertEqual(sut.difficultiesButtons.count, 0)
    }

    func test_viewDidLoad_DifficultiesButtonsCreated() {
        let difficulties = ["Easy", "Medium", "Hard"]
        let sut = makeSUT(difficulties: difficulties)
        XCTAssertEqual(sut.difficultiesButtons.count, difficulties.count)
    }

    func test_difficultySelected_difficultyRouted() {
        let difficulties = ["Easy", "Medium", "Hard"]
        var receivedDifficulty = ""
        let sut = makeSUT(difficulties: difficulties) { receivedDifficulty = $0 }
        sut.difficultiesButtons[1].initiateTap()
        XCTAssertEqual(receivedDifficulty, "Medium")
    }
}

extension DifficultyViewControllerTest {
    func makeSUT(difficulties: [String] = [String](),
                 title: String = "",
                 submitDifficultyCallback: @escaping (String) -> Void = { _ in }) -> DifficultyViewController {
        let viewController = DifficultyViewController(difficulties: difficulties,
                                                      title: title,
                                                      submitDifficultyCallback: submitDifficultyCallback)
        _ = viewController.view
        
        return viewController
    }
    
}

extension UIButton {
    func initiateTap() {
        self.sendActions(for: .touchUpInside)
    }
}
