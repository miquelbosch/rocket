//
//  RocketListViewModelTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

//internal protocol RocketListView: class {
//    var title: String? { get set }
//    func showLoading()
//    func hideLoading()
//    func showError(type: ResponseError)
//    func update(rockets: [Rocket])
//}

private class RocketListViewMock: RocketListView {

    var title: String?

    private(set) var isSuccess = false
    private(set) var isLoading = false
    private(set) var isError = false

    func showLoading() {
        isLoading = true
    }

    func hideLoading() {
        isLoading = false
    }

    func showError(type: ResponseError) {
        isError = true
    }

    func update(rockets: [Rocket]) {
        isSuccess = true
    }
}

private class RocketListRepositoryMock: RocketListRepositoryProtocol {

    public var forceError: Bool = false

    func rocketList(completion completed: @escaping (Result<Rockets, ResponseError>) -> Void) {
        let rocket = Rocket(height: "0", engines: "0", name: "Filomena 9398", firstFlight: Date(), description: "First Rocket", country: "Spain", company: "Covadonga", image: "https://www.test.com")
        let rockets = Rockets(rockets: [rocket])

        forceError ? completed(.failure(.general)) : completed(.success(rockets))
    }
}

class RocketListViewModelTest: XCTestCase {

    private var sut: RocketListViewModel!
    private var repository: RocketListRepositoryMock!
    private var view: RocketListViewMock!

    override func setUpWithError() throws {
        super.setUp()

        repository = RocketListRepositoryMock()
        view = RocketListViewMock()
    }

    override func tearDownWithError() throws {
        super.tearDown()

        sut = nil
        repository = nil
    }

    func test_repository_success() {

        //GIVEN
        repository.forceError = false

        sut = RocketListViewModel(repository: repository)

        sut.view = view

        //WHEN
        sut.loadView()

        //THEN
        XCTAssertTrue(view.isSuccess)
        XCTAssertFalse(view.isError)
        XCTAssertFalse(view.isLoading)
    }

    func test_repository_failure() {

        //GIVEN
        repository.forceError = true

        sut = RocketListViewModel(repository: repository)

        sut.view = view

        //WHEN
        sut.loadView()

        //THEN
        XCTAssertFalse(view.isSuccess)
        XCTAssertTrue(view.isError)
        XCTAssertFalse(view.isLoading)
    }
}
