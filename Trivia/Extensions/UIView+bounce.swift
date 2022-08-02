//
//  UIView+bounce.swift
//  Trivia
//
//  Created by Alejandro Exequiel Taborda on 01/08/2022.
//

import UIKit

extension UIView {
    func bounce() {
        UIView.animate(withDuration: 0.15, delay: 0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.center = CGPoint(x: 350, y: 500)
            self.alpha = 1
        },completion: nil)
    }
}
