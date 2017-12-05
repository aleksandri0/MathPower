import Foundation

struct PresentableAnswer {
    let calculation: String
    let answer: String
    let wrongAnswer: String?
    
    var isCorrect: Bool {
        return wrongAnswer == nil
    }
}
