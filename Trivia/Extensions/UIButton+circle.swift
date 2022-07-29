//
//  UIButton+circle.swift
//  Trivia
//
//  Created by Alejandro Exequiel Taborda on 27/07/2022.
//

import UIKit

extension UIButton {
    func roundButtons(_ button: UIButton) {
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
    }
}
