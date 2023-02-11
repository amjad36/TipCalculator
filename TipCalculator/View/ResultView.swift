//
//  ResultView.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit

class ResultView: UIView {
    
    private let headerLabel: UILabel = {
        LabelFactory.build(
            text: "Total p/person",
            font: ThemeFont.demobold(ofSize: 18))
    }()
    
    private let amountPerPersonLable: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "$0",
            attributes: [.font: ThemeFont.demobold(ofSize: 48)])
        text.addAttributes(
            [.font: ThemeFont.demobold(ofSize: 24)],
            range: NSMakeRange(0, 1))
        label.attributedText = text
        label.textAlignment = .center
        return label
    }()
    
    private let separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = ThemeColor.separator
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerLabel,
            amountPerPersonLable,
            separatorLineView,
            buildSpacerView(height: 0),
            hStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let totalBillView: AmountView = {
        AmountView(
            title: "Total bill",
            textAlignment: .left)
    }()
    
    private let totalTipView: AmountView = {
        AmountView(
            title: "Total tip",
            textAlignment: .right)
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            totalBillView,
            UIView(),
            totalTipView
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
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
        backgroundColor = .white
        layer.cornerRadius = 12.0
        addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(24)
        }
        
        separatorLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
        addShadow(
            offset: CGSizeMake(0, 3),
            color: .black,
            opacity: 0.1,
            radius: 12.0)
    }
    
    func configure(result: Result) {
        let text = NSMutableAttributedString(
            string: "\(result.totalPerPerson.currencyFormatted)",
            attributes: [.font: ThemeFont.demobold(ofSize: 48)])
        text.addAttributes(
            [.font: ThemeFont.demobold(ofSize: 24)],
            range: NSMakeRange(0, 1))
        amountPerPersonLable.attributedText = text
        totalBillView.configure(amount: result.totalBill)
        totalTipView.configure(amount: result.totalTip)
    }
    
    private func buildSpacerView(height: CGFloat) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
}
