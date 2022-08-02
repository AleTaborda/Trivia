//
//  InitialViewController.swift
//  Trivia
//
//  Created by Alejandro Exequiel Taborda on 21/07/2022.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Outlets
    
    @IBOutlet weak var userTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeHolder()
        userTextField.delegate = self
        
    }
    // MARK: - Present Navigation Button Action Event
    @IBAction func startTriviaTapped(_ sender: Any) {
        if userTextField.hasText {
            let vc = QuestionViewController (nibName: "QuestionViewController", bundle: nil)
            self.present(vc, animated: true)
        } else {
            userTextField.shake()
        }
    }
    
    // MARK: - View Methods
    
    private func placeHolder() {
        let grayPlaceholderText = NSAttributedString(string: "Escribe tu usuario...",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        userTextField.attributedPlaceholder = grayPlaceholderText
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


