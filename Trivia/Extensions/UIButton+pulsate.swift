//
//  UIButton+pulsate.swift
//  Trivia
//
//  Created by Alejandro Exequiel Taborda on 29/07/2022.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 0.98
        pulse.toValue = 1.5
        pulse.autoreverses = true
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}
