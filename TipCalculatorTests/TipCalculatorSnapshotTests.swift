//
//  TipCalculatorSnapshotTests.swift
//  TipCalculatorTests
//
//  Created by Amjad Khan on 26/02/23.
//

import UIKit
import XCTest
import SnapshotTesting
@testable import TipCalculator

final class TipCalculatorSnapshotTests: XCTestCase {

    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }

    func testLogoView() {
        //given
        let size = CGSize(width: screenWidth, height: 48)
        //when
        let view = LogoView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testInitialResultView() {
        //given
        let size = CGSize(width: screenWidth, height: 224)
        //when
        let view = ResultView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testResultViewWithValue() {
        //given
        let size = CGSize(width: screenWidth, height: 224)
        let result = Result(
            totalPerPerson: 60,
            totalBill: 120,
            totalTip: 20)
        //when
        let view = ResultView()
        view.configure(result: result)
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testInitialBillInputView() {
        //given
        let size = CGSize(width: screenWidth, height: 56)
        //when
        let view = BillInputView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testBillInputViewWithValue() {
        //given
        let size = CGSize(width: screenWidth, height: 56)
        //when
        let view = BillInputView()
        let textfield = view.allSubViewsOf(type: UITextField.self).first
        textfield?.text = "500"
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testInitialTipInputView() {
        //given
        let size = CGSize(width: screenWidth, height: 128)
        //when
        let view = TipInputView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testTipInputViewWithValue() {
        //given
        let size = CGSize(width: screenWidth, height: 128)
        //when
        let view = TipInputView()
        let tenPercentButton = view.allSubViewsOf(type: UIButton.self).first
        tenPercentButton?.sendActions(for: .touchUpInside)
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testInitialSplitllInputView() {
        //given
        let size = CGSize(width: screenWidth, height: 48)
        //when
        let view = SplitInputView()
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }

    func testSplitllInputViewWithValue() {
        //given
        let size = CGSize(width: screenWidth, height: 48)
        //when
        let view = SplitInputView()
        let incrementButton = view.allSubViewsOf(type: UIButton.self).last
        incrementButton?.sendActions(for: .touchUpInside)
        //then
        assertSnapshot(matching: view, as: .image(size: size))
    }
}

extension UIView {
    // https://stackoverflow.com/questions/32151637/swift-get-all-subviews-of-a-specific-type-and-add-to-an-array/45297466#45297466
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T] {
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}
