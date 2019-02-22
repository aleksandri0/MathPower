import Foundation
import UIKit
import MathPowerLogic

protocol ViewControllerFactory {
    func difficultyViewController(difficulties: [Difficulty],
                                  title: String,
                                  submitDifficultyCallback: @escaping (Difficulty) -> Void) -> UIViewController
}
