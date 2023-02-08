//
//  SplitInputView.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

class SplitInputView: UIView {
    
    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.configureView(
            topText: "Split",
            bottomText: "the total")
        return view
    }()
    
    private lazy var decrementButton: UIButton = {
        let button = buildButton(
            title: "-",
            corners: [
                .layerMinXMaxYCorner,
                .layerMinXMinYCorner
            ])
        return button
    }()
    
    private lazy var incrementButton: UIButton = {
        let button = buildButton(
            title: "+",
            corners: [
                .layerMaxXMinYCorner,
                .layerMaxXMaxYCorner
            ])
        return button
    }()
    
    private lazy var quantityLabel: UILabel = {
        let label = LabelFactory.build(
            text: "1",
            font: ThemeFont.bold(ofSize: 20),
            backgroundColor: .white)
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            decrementButton,
            quantityLabel,
            incrementButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = 0
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
        [headerView, hStackView].forEach(addSubview(_:))
        
        hStackView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        
        [incrementButton, decrementButton].forEach { button in
            button.snp.makeConstraints { make in
                make.width.equalTo(button.snp.height)
            }
        }
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(hStackView)
            make.trailing.equalTo(hStackView.snp.leading).offset(-24)
            make.width.equalTo(68)
        }
    }
    
    private func buildButton(title: String, corners: CACornerMask) -> UIButton {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.setTitle(title, for: .normal)
        button.backgroundColor = ThemeColor.primary
        button.tintColor = .white
        button.addRoundedCorner(corners: corners, radius: 8.0)
        return button
    }
}
