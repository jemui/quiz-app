//
//  Question.swift
//  QuizApp
//
//  Created by Jeanette on 1/23/25.
//  

import Foundation

struct Question: Hashable {
    let text: String
    let answer: String
    init(_ text: String, _ answer: String) {         
        self.text = text
        self.answer = answer
        
    }
}
