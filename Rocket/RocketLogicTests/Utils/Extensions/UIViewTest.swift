//
//  UIViewTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

class UIViewTest: XCTestCase {

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

        //GIVEN
        let parentView = UIView(frame: .zero)
        let childView = UIView(frame: .zero)
        parentView.addSubview(childView)

        //WHEN
        childView.anchorCenterY(to: parentView.centerYAnchor)

        //THEN
        XCTAssertNotNil(childView.centerYAnchor)
    }

    func test_round_corners_success() {

        // GIVEN
        let parentView = UIView(frame: .zero)

        //WHEN
        parentView.round(.topLeft, radius: CGFloat(18))

        //THEN
        XCTAssertNotNil(parentView.layer)
    }

    func test_round_imgageLoad_success() {

        // GIVEN
        let url = URL(string: "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg")
        let expectationImageLoad = expectation(description: "RocketListImageLoad")
        let imageView = UIImageView()

        //WHEN
        imageView.load(url: url!) {
            expectationImageLoad.fulfill()
        }

        //THEN
        wait(for: [expectationImageLoad], timeout: 8)
    }
}
