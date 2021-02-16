//
//  DetailCoordinatorTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 16/02/2021.
//

import XCTest
@testable import RocketLogic

class DetailCoordinatorTest: XCTestCase {

    private var sut: DetailCoordinator!
    private var navigationController: UINavigationController!

    override func setUpWithError() throws {
        super.setUp()

        navigationController = UINavigationController()
        sut = DetailCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        navigationController = nil
        sut = nil
    }

    func test_detail_rocket_success() {

        let rocket = Rocket(height: Constants.CrossFeature.nilChar, engines: Constants.CrossFeature.nilChar, name: Constants.CrossFeature.nilChar, firstFlight: Date(), description: Constants.CrossFeature.nilChar, country: Constants.CrossFeature.nilChar, company: Constants.CrossFeature.nilChar, image: Constants.CrossFeature.nilChar)

        sut?.displayDetail(rocket: rocket)
        XCTAssertTrue(navigationController.visibleViewController is DetailViewController)
    }
}
