//
//  UIResponder+Extension.swift
//  TipCalculator
//
//  Created by Amjad Khan on 08/02/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        next as? UIViewController ?? next?.parentViewController
    }
}
