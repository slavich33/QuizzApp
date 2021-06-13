//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        quizBrain.getColor(userGotItRight, color: sender)
        quizBrain.nextQuestion()
        //        quizBrain.getScore(quizBrain.getColor(quizBrain.checkAnswer(userAnswer), color: sender), score: scoreLabel)
        //It's the second method to dispatch color from button
        //        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        updateUI()
    }
    
    @objc func updateUI () {
        quizBrain.Disp(firstButton: firstButton, secondButton: secondButton, thirdButton: thirdButton)
        firstButton.setTitle(quizBrain.getButtonText()[0], for: .normal)
        secondButton.setTitle(quizBrain.getButtonText()[1], for: .normal)
        thirdButton.setTitle(quizBrain.getButtonText()[2], for: .normal)
        scoreLabel.text = " Score: \(quizBrain.getScore()) "
        questionLabel.text = quizBrain.getQuestionText()
        //Shit omg progress functionality
        progressBar.progress = quizBrain.getProgress()
        //        quizBrain.getScore(quizBrain.getColor(quizBrain.checkAnswer(userAnswer), color: sender), score: scoreLabel)
    }
    
}

