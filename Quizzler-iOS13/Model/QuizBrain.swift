//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Slava on 28.01.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct QuizBrain {
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

]
    var questionNumber = 0
    var score1 = 0
   
    func Disp(firstButton: UIButton, secondButton: UIButton, thirdButton: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            firstButton.backgroundColor = UIColor.clear
            secondButton.backgroundColor = UIColor.clear
            thirdButton.backgroundColor = UIColor.clear
        }
        
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
            score1 += 1
            return true
 
        } else {
           return false
        }
    }
    func getQuestionText() -> String {
       return quiz[questionNumber].text
    }
    func getButtonText() -> [String] {
        return quiz[questionNumber].answer
    }
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    mutating func nextQuestion() {
//        if questionNumber == 0 {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
//        } else if questionNumber == 12 {
        } else {
            questionNumber = 0
            score1 = 0
        }
    }
    func getColor(_ userGotItRight: Bool, color: UIButton) -> Bool{
     
        if userGotItRight {
            color.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            color.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        return userGotItRight
    }
//    mutating func getScore(_ userAnswer: Bool, score: UILabel) {
//
//        if userAnswer {
//           score1 += 1
//            score.text = "Score: \(score1)"
//
//    }else {
//            score1 += 0
//            score.text = "Score: \(score1)"
//        }
////        if questionNumber == 0 {
////        score1 = 0}
////        print(quiz.count)
////        print(questionNumber)
//
//    }
    func getScore() -> Int {
        return score1
    }
}
