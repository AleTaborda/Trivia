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
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rightAnswerButton()
        wrongAnswerButton()
    }

    @IBAction func rightAnswerTapped(_ sender: UIButton) {
        sender.pulsate()
    }
    
    @IBAction func wrongAnswerTapped(_ sender: UIButton) {
        sender.pulsate()
    }
    // MARK: - View Methods
    func rightAnswerButton() {
        rightAnswer.roundButtons(rightAnswer)
        let tickImage = UIImage(named: "tick.png")
        rightAnswer.setImage(tickImage, for: .normal)
        rightAnswer.imageView?.contentMode = .scaleAspectFit
    }
    func wrongAnswerButton() {
        wrongAnswer.roundButtons(wrongAnswer)
        let crossImage = UIImage(named: "cross.png")
        wrongAnswer.setImage(crossImage, for: .normal)
        wrongAnswer.imageView?.contentMode = .scaleAspectFill
        
    }
}


