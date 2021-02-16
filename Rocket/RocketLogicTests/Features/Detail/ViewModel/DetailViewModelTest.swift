//
//  DetailViewModelTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 16/02/2021.
//

import XCTest
@testable import RocketLogic

private class DetailViewMock: DetailView {

    var title: String?

    private(set) var isImageShowed = false
    private(set) var isPrincipalInfoShowed = false

    func showImage(url: URL) {
        isImageShowed = true
    }

    func showPrincipalInformation(rocket: Rocket, firstFlight: String) {
        isPrincipalInfoShowed = true
    }
}

class DetailViewModelTest: XCTestCase {

    private var sut: DetailViewModel!
    private var view: DetailViewMock!

    override func setUpWithError() throws {
        super.setUp()

        let rocket = Rocket(height: Constants.CrossFeature.nilChar, engines: Constants.CrossFeature.nilChar, name: Constants.CrossFeature.nilChar, firstFlight: Date(), description: Constants.CrossFeature.nilChar, country: Constants.CrossFeature.nilChar, company: Constants.CrossFeature.nilChar, image: Constants.CrossFeature.nilChar)
        sut = DetailViewModel(rocket: rocket)
        view = DetailViewMock()
    }

    override func tearDownWithError() throws {
        super.tearDown()

        sut = nil
        view = nil
    }

    func test_viewModel_setup() {

        sut.view = view

        //THEN
        sut.setup()

        //WHEN
        XCTAssertTrue(view.isImageShowed)
        XCTAssertTrue(view.isPrincipalInfoShowed)
    }
}
