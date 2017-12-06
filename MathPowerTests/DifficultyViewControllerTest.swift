import XCTest
@testable import MathPower

class DifficultyViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_difficultiesRendered() {
        let difficulties = [String]()
        let sut = DifficultyViewController()
        _ = sut.view
        
        XCTAssertEqual(sut.difficulties, difficulties)
    }
    
}
