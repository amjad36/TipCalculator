//
//  ThemeFont.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

struct ThemeFont {
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func demobold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Demibold", size: size) ?? .systemFont(ofSize: size)
    }
}
