//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Yasuhiro Yoshida on 2022-01-18.
//

import XCTest

class when_calculating_tip_based_on_total_amount: XCTestCase {

  func test_should_calculate_tip_successfully() {
    let tipCalculator = TipCalculator()
    let tip = try! tipCalculator.calculate(total: 100.0, tipPercentage: 0.1)
    XCTAssertEqual(tip, 10)
  }
}

class when_calculating_tip_based_on_negative_total_amount: XCTestCase {

  func test_should_throw_invalid_input_exception() {
    let tipCalculator = TipCalculator()

    XCTAssertThrowsError(try tipCalculator.calculate(total: -100.0, tipPercentage: 0.1), "") { error in
      XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
    }
  }
}
