//
//  ViewController.swift
//  QuizApp
//
//  Created by Jeanette on 1/23/25.
//  

import UIKit

@MainActor
class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let red = UIColor.init(cgColor: .init(red: 255.0, green: 0.0, blue: 0.0, alpha: 0.5))
    let green = UIColor.init(cgColor: .init(red: 0, green: 255.0, blue: 0.0, alpha: 0.5))
    
    var quizBrain = QuizBrain(correctAnswers: 0.0, quizIdx: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let question = quizBrain.getQuestion()
        questionLabel.text = question.text
        progressBar.progress = quizBrain.getProgress()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else { return }
        
        let result = quizBrain.checkAnswer(text)
        
        if(result) {
            progressBar.progress = quizBrain.getProgress()
            sender.backgroundColor = green
        }
        else {
            sender.backgroundColor = red
        }
        
        // reset color
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] timer in
            guard let self = self else {return}
            
            Task { @MainActor in
                let otherButton = sender == trueButton ? falseButton : trueButton
                sender.backgroundColor = UIColor.clear
                otherButton?.backgroundColor = UIColor.clear
                
                updateQuestion()
            }
        }
    }
    
    func updateQuestion () {
        let question = quizBrain.getQuestion()
        questionLabel.text = question.text
        progressBar.progress = quizBrain.getProgress()
    }
    
}
