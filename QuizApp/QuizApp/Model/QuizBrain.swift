//
//  QuizBrain.swift
//  QuizApp
//
//  Created by Jeanette on 1/23/25.
//

import Foundation

struct QuizBrain {
    var correctAnswers: Float = 0.0
    var quizIdx: Int = 0
    var score: Int = 0
    
    init(correctAnswers: Float, quizIdx: Int, score: Int? = 0) {
        self.correctAnswers = correctAnswers
        self.quizIdx = quizIdx
        
    }
    
    
    let quiz: [Int: Question] = [
        0: Question( "4+2 = 6",  "True"),
        1: Question("5-3 > 1",  "True"),
        2: Question("3+8 < 10", "False")
    ]
    
    func getProgress() -> Float {
        return correctAnswers / Float(quiz.count)
    }
    
    mutating func setScore(newScore: Int) -> Int {
        self.score = newScore
        return self.score
    }
    
    mutating func updateScore() -> Int {
        self.score += 1
        return self.score
    }
    
    mutating func randomizeQuestionIndex() {
        var rndIdx = Int.random(in: 0...quiz.count-1)
        while rndIdx == quizIdx {
            rndIdx = Int.random(in: 0...quiz.count-1)
        }
        quizIdx = rndIdx
    }
    
    mutating func getQuestion() -> Question {
        randomizeQuestionIndex()
        guard let result = quiz[quizIdx] else {return Question("","")}
        return result
        
    }
    
    mutating func checkAnswer(_ answer: String) -> Bool {
        guard let result = quiz[quizIdx] else { return false}
        if(answer == result.answer) {
            let _ = updateScore()
            correctAnswers = Float((Int(correctAnswers) + 1) % quiz.count)
        
            return true
        }
        else {
            return false
        }
        
       
    }
    
}
