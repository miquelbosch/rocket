//
//  DateManagerTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

class DateManagerTest: XCTestCase {

    var sut: Date!

    override func setUpWithError() throws {
        super.setUp()

        let calendar = Calendar.current

        var components = DateComponents()
        components.month = 01
        components.day = 11
        components.year = 2021

        sut = calendar.date(from: components)
    }

    override func tearDownWithError() throws {
        super.tearDown()
        sut = nil
    }

    func test_format_date_01() {

        //THEN
        let date = DateManager.date(original: "11/01/2021", to: .ddMMyyyy)

        //WHEN
        XCTAssertEqual(date, sut)
    }

    func test_format_date_02() {

        //THEN
        let date = DateManager.date(original: sut, to: .yyyyMMdd)

        //WHEN
        XCTAssertEqual(date, "2021-01-11")
    }
}
