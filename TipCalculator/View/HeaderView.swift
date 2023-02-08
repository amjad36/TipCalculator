//
//  HeaderView.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

class HeaderView: UIView {
    
    private let topLabel: UILabel = {
        LabelFactory.build(
            text: nil,
            font: ThemeFont.bold(ofSize: 18))
    }()
    
    private let bottomLabel: UILabel = {
        LabelFactory.build(
            text: nil,
            font: ThemeFont.regular(ofSize: 16))
    }()
    
    private let topSpacerView = UIView()
    private let bottomSpacerView = UIView()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            topSpacerView,
            topLabel,
            bottomLabel,
            bottomSpacerView
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = -4
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topSpacerView.snp.makeConstraints { make in
            make.height.equalTo(bottomSpacerView)
        }
    }
    
    func configureView(topText: String, bottomText: String) {
        topLabel.text = topText
        bottomLabel.text = bottomText
    }
}

