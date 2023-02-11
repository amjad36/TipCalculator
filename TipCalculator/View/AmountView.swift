//
//  AmountView.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

class AmountView: UIView {
    
    private let title: String
    private let textAlignment: NSTextAlignment
    
    private lazy var topLabel: UILabel = {
        LabelFactory.build(
            text: title,
            font: ThemeFont.regular(ofSize: 18),
            textAlignment: textAlignment)
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [
                .font: ThemeFont.bold(ofSize: 24),
                .foregroundColor: ThemeColor.secondary])
        text.addAttributes([.font: ThemeFont.demobold(ofSize: 16)], range: NSMakeRange(0, 1))
        label.attributedText = text
        label.textColor = ThemeColor.secondary
        label.textAlignment = textAlignment
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            topLabel,
            bottomLabel
        ])
        stackView.axis = .vertical
        return stackView
    }()
    
    init(title: String, textAlignment: NSTextAlignment) {
        self.title = title
        self.textAlignment = textAlignment
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(amount: Double) {
        let text = NSMutableAttributedString(
            string: amount.currencyFormatted,
            attributes: [
                .font: ThemeFont.bold(ofSize: 24),
                .foregroundColor: ThemeColor.secondary])
        text.addAttributes([.font: ThemeFont.demobold(ofSize: 16)], range: NSMakeRange(0, 1))
        bottomLabel.attributedText = text
    }
    
    private func setupView() {
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
