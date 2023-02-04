//
//  ViewController.swift
//  TipCalculator
//
//  Created by Amjad Khan on 04/02/23.
//

import UIKit
import SnapKit

class CalculatorViewController: UIViewController {
    
    let logoView = LogoView()
    let resultView = ResultView()
    let billInputView = BillInputView()
    let tipInputView = TipInputView()
    let splitInputView = SplitInputView()
    
    private lazy var vStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoView,
            resultView,
            billInputView,
            tipInputView,
            splitInputView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 36
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(vStackView)
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(56)
            make.leading.trailing.bottom.equalToSuperview().inset(24)
        }
        
        logoView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        
        resultView.snp.makeConstraints { make in
            make.height.equalTo(224)
        }
        
        billInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        
        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(128)
        }
        
        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
}

