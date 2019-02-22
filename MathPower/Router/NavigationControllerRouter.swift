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

    func routeToDifficulty(difficulties: [Difficulty], callBack: @escaping (Difficulty) -> Void) {
        let difficultyViewController = viewControllerFactory.difficultyViewController(difficulties: difficulties,
                                                                                      title: "",
                                                                                      submitDifficultyCallback: callBack)
        navigationController.pushViewController(difficultyViewController, animated: true)
    }
    func routeTo(calculation: String, difficulty: Difficulty, callBack: @escaping (String) -> Void) {

    }
    func routeTo(result: [String : String]?, restartCallBack: @escaping () -> Void) {

    }
}
