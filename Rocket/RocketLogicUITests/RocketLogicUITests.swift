//
//  RocketLogicUITests.swift
//  RocketLogicUITests
//
//  Created by Miquel Bosch on 16/02/2021.
//

import XCTest

class RocketLogicUITests: XCTestCase {

    private let timeout: Double = 8
    private var app: XCUIApplication!

    private var isDisplayingMainListView: Bool {
        return app.otherElements[""].waitForExistence(timeout: timeout)
    }

    override func setUpWithError() throws {
        super.setUp()

        app = XCUIApplication()
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        super.tearDown()

        app = nil
    }

    func test_main_list() {

        app.launch()

        let rocketsTableView = app.tables["UITableViewID"]
        XCTAssertTrue(rocketsTableView.exists)
    }

    func test_check_info_cell() {

        app.launch()

        let rocketsTableView = app.tables["UITableViewID"]

        let cell = rocketsTableView.children(matching: .cell).matching(identifier: "RocketTableViewCellID").element(boundBy: 3)
        XCTAssertEqual(cell.staticTexts["RocketTableViewCellUILabelID"].label, "Starship")
        cell.tap()
    }

    func test_navigate_detail() {

        app.launch()

        let rocketsTableView = app.tables["UITableViewID"]

        let cell = rocketsTableView.children(matching: .cell).matching(identifier: "RocketTableViewCellID").element(boundBy: 3)
        cell.tap()

        XCTAssertTrue(app.images["detailPictureID"].exists)
    }
}
