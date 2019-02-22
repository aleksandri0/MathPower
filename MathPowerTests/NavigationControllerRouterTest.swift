import Foundation
import XCTest
import MathPowerLogic
@testable import MathPower

class NavigationControllerRouterTest: XCTestCase {
    func test_routesToDifficulty_vcAdded() {
        let navigationController = UINavigationController()
        let sut = makeSUT(navigationController: navigationController)
        sut.routeToDifficulty(difficulties: []) { _ in }
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func test_routesToDifficulty_difficultyVCAdded() {
        let navigationController = UINavigationController()
        let viewControllerFactoryStub = ViewControllerFactoryStub()
        let difficultyViewController = DifficultyViewController()
        viewControllerFactoryStub.difficultyViewController = difficultyViewController
        let sut = makeSUT(navigationController: navigationController, viewControllerFactory: viewControllerFactoryStub)
        sut.routeToDifficulty(difficulties: []) { _ in }
        XCTAssertEqual(navigationController.viewControllers.first, difficultyViewController)
    }

    class ViewControllerFactoryStub: ViewControllerFactory {
        var difficultyViewController = UIViewController()
        func difficultyViewController(difficulties: [Difficulty],
                                      title: String,
                                      submitDifficultyCallback: @escaping (Difficulty) -> Void) -> UIViewController {
            return difficultyViewController
        }
    }

}

extension NavigationControllerRouterTest {
    func makeSUT(navigationController: UINavigationController = UINavigationController(),
                 viewControllerFactory: ViewControllerFactory = ViewControllerFactoryStub()) -> NavigationControllerRouter {
        return NavigationControllerRouter(navigationController, viewControllerFactory: viewControllerFactory)
    }
}
