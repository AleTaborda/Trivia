//
//  UIView+vibrate.swift
//  Trivia
//
//  Created by Alejandro Exequiel Taborda on 27/07/2022.
//

import UIKit

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

extension UIView {
    func bounce() {
        UIView.animate(withDuration: 0.15, delay: 0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            self.center = CGPoint(x: 350, y: 500)
            self.alpha = 1
        },completion: nil)
    }
}

