import Foundation
import UIKit
import MathPowerLogic

protocol ViewControllerFactory {
    func difficultyViewController(difficulties: [Difficulty],
                                  submitDifficultyCallback: @escaping (Difficulty) -> Void) -> UIViewController
    func calculationViewController(calculation: String,
                                   difficulty: Difficulty,
                                   submitAnswerCallback: @escaping (String) -> Void) -> UIViewController
}
