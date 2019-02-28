import Foundation
import UIKit
import MathPowerLogic

class NavigationControllerRouter: Router {
    private let navigationController: UINavigationController
    private let viewControllerFactory: ViewControllerFactory

    init(_ navigationController: UINavigationController, viewControllerFactory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
    }

    func routeToDifficulties(_ difficulties: [Difficulty], callback: @escaping (Difficulty) -> Void) {
        let difficultyViewController = viewControllerFactory.difficultyViewController(difficulties: difficulties,
                                                                                      submitDifficultyCallback: callback)
        navigationController.pushViewController(difficultyViewController, animated: false)
    }
    func routeToCalculation(_ calculation: String, difficulty: Difficulty, callback: @escaping (String) -> Void) {
        let calculationViewController = viewControllerFactory.calculationViewController(calculation: calculation,
                                                                                        difficulty: difficulty,
                                                                                        submitAnswerCallback: callback)
        navigationController.pushViewController(calculationViewController, animated: false)
    }
    func routeToResult(_ result: [String : String]?, restartCallback: @escaping () -> Void) {

    }
}
