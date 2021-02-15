//
//  NibViewLoadTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
import UIKit
@testable import RocketLogic

class NibViewLoadTest: XCTestCase {

    func test_create_view_success() {

        let errorView = ErrorView.createView()
        XCTAssertNotNil(errorView)
    }

    func test_create_view_nil() {

        let errorView = ErrorView.createView(forceFailure: true)
        XCTAssertNil(errorView)
    }
}
