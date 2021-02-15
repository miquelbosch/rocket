//
//  UIViewTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

class UIViewTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }



    func test_anchor_to_success() {

        // GIVEN
        let parentView = UIView(frame: .zero)
        let childView = UIView(frame: .zero)
        parentView.addSubview(childView)

        //WHEN
        childView.anchorTo(parentView)

        //THEN
        XCTAssertNotNil(childView.topAnchor)
    }

    func test_center_to_X_success() {

        // GIVEN
        let parentView = UIView(frame: .zero)
        let childView = UIView(frame: .zero)
        parentView.addSubview(childView)

        //WHEN
        childView.anchorCenterX(to: parentView.centerXAnchor)

        //THEN
        XCTAssertNotNil(childView.centerXAnchor)
    }

    func test_center_to_Y_success() {

        // GIVEN
        let parentView = UIView(frame: .zero)
        let childView = UIView(frame: .zero)
        parentView.addSubview(childView)

        //WHEN
        childView.anchorCenterY(to: parentView.centerYAnchor)

        //THEN
        XCTAssertNotNil(childView.centerYAnchor)
    }
}
