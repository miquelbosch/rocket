//
//  NSObjectTest.swift
//  RocketUITests
//
//  Created by Miquel Bosch on 13/02/2021.
//

import XCTest
@testable import RocketLogic

class NSObjectTest: XCTestCase {

    // MARK: - Test NSObjectTest Extension
    func test_nameClass_01() throws {
        XCTAssertEqual("UIView", UIView.name)
    }

    func test_nameClass_02() throws {
        XCTAssertEqual("UIColor", UIColor.name)
    }

    func test_nameClass_03() throws {
        XCTAssertEqual("UITableViewCell", UITableViewCell.name)
    }

    func test_nameClass_failure() throws {
        XCTAssertNotEqual("UITableView", UITableViewCell.name)
    }
}
