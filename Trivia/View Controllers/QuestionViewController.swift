//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Alejandro Exequiel Taborda on 26/07/2022.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var rightAnswer: UIButton!
    @IBOutlet weak var wrongAnswer: UIButton!
    @IBOutlet weak var score: UILabel!
    
    private let questions = Contenido.shared.obtenerPreguntas()
    private var currentQuestionIndex: Int = 0
    private var scoreBoard: Int = 0 {
        didSet {
            score.text = "Score: \(scoreBoard)"
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentQuestion(for: currentQuestionIndex)

        rightAnswerButton()
        wrongAnswerButton()
    }

    @IBAction func rightAnswerTapped(_ sender: UIButton) {
        sender.pulsate()
        let result = validateCurrentQuestion(answer: true)
        sendResultMessage(for: result)
    }
    
    @IBAction func wrongAnswerTapped(_ sender: UIButton) {
        sender.pulsate()
        let result = validateCurrentQuestion(answer: false)
        sendResultMessage(for: result)
    }
    // MARK: - View Methods
    private func rightAnswerButton() {
        rightAnswer.roundButtons(rightAnswer)
        let tickImage = UIImage(named: "tick.png")
        rightAnswer.setImage(tickImage, for: .normal)
        rightAnswer.imageView?.contentMode = .scaleAspectFit
    }
    private func wrongAnswerButton() {
        wrongAnswer.roundButtons(wrongAnswer)
        let crossImage = UIImage(named: "cross.png")
        wrongAnswer.setImage(crossImage, for: .normal)
        wrongAnswer.imageView?.contentMode = .scaleAspectFill
    }
    private func updateQuestion() {
        currentQuestionIndex += 1
        setCurrentQuestion(for: currentQuestionIndex)
    }
    private func setCurrentQuestion(for index: Int) {
        if index < questions.count {
            questionLabel.text = questions[index].question
        } else {
            currentQuestionIndex = 0
            questionLabel.text = questions[currentQuestionIndex].question
        }
    }
    private func validateCurrentQuestion(answer: Bool) -> Bool {
        return questions[currentQuestionIndex].answer == answer
    }
    private func sendResultMessage(for result: Bool) {
        var message: String
        if result {
            message = "La respuesta es correcta! 🥳"
            scoreBoard += 1
            score.bounce()
        } else {
            message = "La respuesta es incorrecta 😔"
            score.shake()
        }
        let alert = UIAlertController(title: "Respuesta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.updateQuestion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


