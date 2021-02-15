//
//  ErrorViewTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

class ErrorViewTest: XCTestCase {

    func test_setup_success() {

        //GIVEN
        let errorView = ErrorView.createView()

        //THEN
        errorView?.setup(errorType: .general)

        //WHEN
        XCTAssertEqual(errorView?.descriptionLabel.text, "rocket_app_error_general".localize)
    }

}
