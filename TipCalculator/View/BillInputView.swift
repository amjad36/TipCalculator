//
//  BillInputView.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

class BillInputView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGray
    }
}

