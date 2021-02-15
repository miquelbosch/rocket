//
//  ResponseErrorTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

class ResponseErrorTest: XCTestCase {

    func test_error_description() {

        var errorDescription: String = Constants.CrossFeature.nilChar
        errorDescription = "rocket_app_error_server".localize
        XCTAssert(errorDescription == ResponseError.server.description)
        errorDescription = "rocket_app_error_timeOut".localize
        XCTAssert(errorDescription == ResponseError.timeOut.description)
        errorDescription = "rocket_app_error_general".localize
        XCTAssert(errorDescription == ResponseError.general.description)
        errorDescription = "rocket_app_error_mapping".localize
        XCTAssert(errorDescription == ResponseError.mapping.description)

        errorDescription = "fatal error"
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "fatal error"])
        XCTAssert(errorDescription == ResponseError.unknow(error: error).description)
    }
}
