// 

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ResultsViewController(
            title: "Results",
            summary: "You answered 1/2",
            answers: [PresentableAnswer(calculation: "1+1",
                                        answer: "2",
                                        wrongAnswer: nil),
                      PresentableAnswer(calculation: "2+2",
                                        answer: "4",
                                        wrongAnswer: "6")])
            
        _ = viewController.view
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()

        return true
    }

}

