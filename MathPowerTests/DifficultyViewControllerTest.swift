import XCTest
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
    
    func makeSUT(
        difficulties: [String] = [String](),
        title: String = "") -> DifficultyViewController {
        let viewController = DifficultyViewController(difficulties: difficulties, title: title)
        _ = viewController.view
        
        return viewController
    }
    
}
