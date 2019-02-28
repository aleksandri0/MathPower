import Foundation
import XCTest
import MathPowerLogic
@testable import MathPower

class NavigationControllerRouterTest: XCTestCase {
    func test_routesToDifficulty_vcAdded() {
        let navigationController = UINavigationController()
        let sut = makeSUT(navigationController: navigationController)
        sut.routeToDifficulties([]) { _ in }
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }

    func test_routesToDifficulty_difficultyVCAdded() {
        let navigationController = UINavigationController()
        let viewControllerFactoryStub = ViewControllerFactoryStub()
        let difficultyViewController = DifficultyViewController()
        viewControllerFactoryStub.difficultyViewController = difficultyViewController
        let sut = makeSUT(navigationController: navigationController, viewControllerFactory: viewControllerFactoryStub)
        sut.routeToDifficulties([]) { _ in }
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertEqual(navigationController.viewControllers.first, difficultyViewController)
    }

    func test_routesToDifficultyAndCalculation_difficultyVCAndCalculationVCAdded() {
        let navigationController = UINavigationController()
        let viewControllerFactoryStub = ViewControllerFactoryStub()
        let difficultyViewController = DifficultyViewController()
        let calculationViewController = CalculationViewController()
        viewControllerFactoryStub.difficultyViewController = difficultyViewController
        viewControllerFactoryStub.calculationViewController = calculationViewController
        let sut = makeSUT(navigationController: navigationController, viewControllerFactory: viewControllerFactoryStub)

        sut.routeToDifficulties([]) { _ in }
        sut.routeToCalculation("", difficulty: .easy) { _ in }

        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertEqual(navigationController.viewControllers.first, difficultyViewController)
        XCTAssertEqual(navigationController.viewControllers.last, calculationViewController)
    }

    class ViewControllerFactoryStub: ViewControllerFactory {
        var difficultyViewController = UIViewController()
        var calculationViewController = UIViewController()
        func difficultyViewController(difficulties: [Difficulty],
                                      submitDifficultyCallback: @escaping (Difficulty) -> Void) -> UIViewController {
            return difficultyViewController
        }
        func calculationViewController(calculation: String,
                                       difficulty: Difficulty,
                                       submitAnswerCallback: @escaping (String) -> Void) -> UIViewController {
            return calculationViewController
        }
    }
}

extension NavigationControllerRouterTest {
    func makeSUT(navigationController: UINavigationController = UINavigationController(),
                 viewControllerFactory: ViewControllerFactory = ViewControllerFactoryStub()) -> NavigationControllerRouter {
        return NavigationControllerRouter(navigationController, viewControllerFactory: viewControllerFactory)
    }
}
