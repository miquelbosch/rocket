//
//  RocketTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

class RocketTest: XCTestCase {

    var units: Units?
    var engines: Engines?
    var response: [RocketListServiceResponse] = []

    override func setUpWithError() throws {
        super.setUp()

        units = Constants.RocketDefault.units
        engines = Constants.RocketDefault.engines
    }

    override func tearDownWithError() throws {
        super.tearDown()

        units = nil
        engines = nil
        response.removeAll()
    }

    func test_response_bind() throws {

        //GIVEN
        let itemOne = RocketListServiceResponse(height: units, engines: engines, name: "Falconero 12", firstFlight: "2006-09-01", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", country: "Spain", company: "Mercadona", flickrImages: nil)
        let enginesTwo = Engines(number: 4)
        let itemTwo = RocketListServiceResponse(height: units, engines: enginesTwo, name: "Falconero 14", firstFlight: "2020-10-08", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", country: "US", company: "Wallmart", flickrImages: nil)
        response = [itemOne, itemTwo]

        //WHEN
        let sut = RocketsResponseBinding.bind(response)

        //THEN
        let nameOne = sut.rockets.first?.name ?? Constants.CrossFeature.nilChar
        XCTAssertEqual(nameOne, "Falconero 12", "The rocket name \(nameOne) doesn't match.")
        let nameTwo = sut.rockets.last?.name ?? Constants.CrossFeature.nilChar
        XCTAssertEqual(nameTwo, "Falconero 14", "The rocket name \(nameTwo) doesn't match.")

        XCTAssertEqual(sut.rockets.first?.height, "0.0 cm")
        XCTAssertEqual(sut.rockets.last?.height, "0.0 cm")
        XCTAssertEqual(sut.rockets.first?.engines, "0")
        XCTAssertEqual(sut.rockets.last?.engines, "4")
        XCTAssertEqual(sut.rockets.first?.description, "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
        XCTAssertEqual(sut.rockets.last?.description, "Lorem ipsum dolor sit amet, consectetur adipiscing elit")
        XCTAssertEqual(sut.rockets.first?.country, "Spain")
        XCTAssertEqual(sut.rockets.last?.country, "US")
        XCTAssertEqual(sut.rockets.first?.company, "Mercadona")
        XCTAssertEqual(sut.rockets.last?.company, "Wallmart")
        XCTAssertEqual(sut.rockets.first?.image, "-")
        XCTAssertEqual(sut.rockets.last?.image, "-")
    }

    func test_response_nil_bind() {

        //GIVEN
        let itemOne = RocketListServiceResponse(height: nil, engines: nil, name: nil, firstFlight: nil, description: nil, country: nil, company: nil, flickrImages: nil)
        let itemTwo = RocketListServiceResponse(height: nil, engines: nil, name: nil, firstFlight: nil, description: nil, country: nil, company: nil, flickrImages: nil)
        response.removeAll()
        response = [itemOne, itemTwo]

        //WHEN
        let sut = RocketsResponseBinding.bind(response)

        //THEN
        XCTAssertEqual(sut.rockets.first?.height, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.last?.height, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.first?.engines, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.last?.engines, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.first?.description, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.last?.description, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.first?.country, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.last?.country, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.first?.company, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.last?.company, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.first?.image, Constants.CrossFeature.nilChar)
        XCTAssertEqual(sut.rockets.last?.image, Constants.CrossFeature.nilChar)
    }
}
