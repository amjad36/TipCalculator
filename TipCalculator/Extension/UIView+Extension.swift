//
//  UIView+Extension.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

extension UIView {
    func addShadow(offset: CGSize, color: UIColor, opacity: Float, radius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor = backgroundCGColor
    }
}
