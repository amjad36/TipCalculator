//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Amjad Khan on 04/02/23.
//

import XCTest
import Combine
@testable import TipCalculator

final class TipCalculatorTests: XCTestCase {

    private var sut: CalculatorViewModel!
    private var cancellables: Set<AnyCancellable>!
    private var audioPlayerService: MockAudioPlayerService!
    private var logoViewTapSubject: PassthroughSubject<Void, Never>!
    
    override func setUp() {
        audioPlayerService = .init()
        sut = .init(audioPlayerService: audioPlayerService)
        logoViewTapSubject = .init()
        cancellables = .init()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        logoViewTapSubject = nil
        cancellables = nil
    }
    
    func testResultWithoutTipForOnePerson() {
        //given
        let bill: Double = 100
        let tip: Tip = .none
        let split: Int = 1
        let input = buildInput(
                bill: bill,
                tip: tip,
                split: split)
        //when
        let output = sut.transform(input: input)
        //then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.totalPerPerson, 100)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }
        .store(in: &cancellables)
    }
    
    func testResultWithoutTipForTwoPerson() {
        //given
        let bill: Double = 100
        let tip: Tip = .none
        let split: Int = 2
        let input = buildInput(
                bill: bill,
                tip: tip,
                split: split)
        //when
        let output = sut.transform(input: input)
        //then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.totalPerPerson, 50)
            XCTAssertEqual(result.totalBill, 100)
            XCTAssertEqual(result.totalTip, 0)
        }
        .store(in: &cancellables)
    }
    
    func testResultWith10PercentTipForTwoPerson() {
        //given
        let bill: Double = 100
        let tip: Tip = .tenPercent
        let split: Int = 2
        let input = buildInput(
                bill: bill,
                tip: tip,
                split: split)
        //when
        let output = sut.transform(input: input)
        //then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.totalPerPerson, 55)
            XCTAssertEqual(result.totalBill, 110)
            XCTAssertEqual(result.totalTip, 10)
        }
        .store(in: &cancellables)
    }
    
    func testResultWith15PercentTipForTwoPerson() {
        //given
        let bill: Double = 100
        let tip: Tip = .fifteenPercent
        let split: Int = 2
        let input = buildInput(
                bill: bill,
                tip: tip,
                split: split)
        //when
        let output = sut.transform(input: input)
        //then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.totalPerPerson, 57.5)
            XCTAssertEqual(result.totalBill, 115)
            XCTAssertEqual(result.totalTip, 15)
        }
        .store(in: &cancellables)
    }
    
    func testResultWith20PercentTipForTwoPerson() {
        //given
        let bill: Double = 100
        let tip: Tip = .twentyPercent
        let split: Int = 2
        let input = buildInput(
                bill: bill,
                tip: tip,
                split: split)
        //when
        let output = sut.transform(input: input)
        //then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.totalPerPerson, 60)
            XCTAssertEqual(result.totalBill, 120)
            XCTAssertEqual(result.totalTip, 20)
        }
        .store(in: &cancellables)
    }
    
    func testResultWithCustomTipForFourPerson() {
        //given
        let bill: Double = 250
        let tip: Tip = .custom(value: 60)
        let split: Int = 4
        let input = buildInput(
                bill: bill,
                tip: tip,
                split: split)
        //when
        let output = sut.transform(input: input)
        //then
        output.updateViewPublisher.sink { result in
            XCTAssertEqual(result.totalPerPerson, 77.5)
            XCTAssertEqual(result.totalBill, 310)
            XCTAssertEqual(result.totalTip, 60)
        }
        .store(in: &cancellables)
    }
    
    func testSoundPlayedAndCalcuculatorResetOnLogotViewTap() {
        //given
        let input = buildInput(
            bill: 100,
            tip: .tenPercent,
            split: 1)
        let output = sut.transform(input: input)
        let expectation1 = XCTestExpectation(description: "reset calculaor called")
        let expectation2 = audioPlayerService.expectaion
        //then
        output.resetCalculatorPublisher.sink { _ in
            expectation1.fulfill()
        }
        .store(in: &cancellables)
        //when
        logoViewTapSubject.send()
        wait(for: [expectation1, expectation2], timeout: 1.0)
    }
    
    private func buildInput(bill: Double, tip: Tip, split: Int) -> CalculatorViewModel.Input {
        return .init(
            billPublisher: Just(bill).eraseToAnyPublisher(),
            tipPublisher: Just(tip).eraseToAnyPublisher(),
            splitPublisher: Just(split).eraseToAnyPublisher(),
            logoViewTapPublisher: logoViewTapSubject.eraseToAnyPublisher())
    }
}

class MockAudioPlayerService: AudioPlayerService {
    let expectaion = XCTestExpectation(description: "audio played")
    func playSound() {
        expectaion.fulfill()
    }
}
