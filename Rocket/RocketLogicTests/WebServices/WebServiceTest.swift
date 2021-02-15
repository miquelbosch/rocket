//
//  WebServiceTest.swift
//  RocketLogicTests
//
//  Created by Miquel Bosch on 15/02/2021.
//

import XCTest
@testable import RocketLogic

// MARK: - SessionMock
private class URLSessionMocked: URLSession {

    var data: Data?
    var response: URLResponse?
    var error: Error?

    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.data, self.response, self.error)
        }
    }
}

// MARK: - TaskMock
private class URLSessionDataTaskMock: URLSessionDataTask {

    let closure: () -> Void

    init(closure: @escaping() -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}

class WebServiceTest: XCTestCase {

    private var url: URL?
    private var sut: WebService!
    private var sessionMocked: URLSessionMocked!

    override func setUpWithError() throws {
        super.setUp()

        url = URL(string: "http.//www.test.com")
        sessionMocked = URLSessionMocked()
    }

    override func tearDownWithError() throws {
        super.tearDown()

        url = nil
        sessionMocked = nil
    }

    func test_fetch_success() {

        //GIVEN
        let response = HTTPURLResponse(url: url!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)

        let bundle = Bundle(for: Self.self)
        let path = bundle.path(forResource: "RocketsTest", ofType: "json")
        let urlPathFile = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: urlPathFile, options: .alwaysMapped)
        let expectationService = expectation(description: "RocketListSuccess")

        var isCallSuccess = false

        sessionMocked.response = response
        sessionMocked.data = data
        sessionMocked.error = nil

        sut = WebService(session: sessionMocked)

        //WHEN
        sut.fetch([RocketListServiceResponse].self, from: .rockets) { response in

            switch response {
            case .success(let rockets):
                isCallSuccess = true
                XCTAssertEqual(rockets.count, 12)
                expectationService.fulfill()
            case .failure(let error):
                isCallSuccess = false
                XCTFail("Something goes wrong in: test_fetch_success() \(error.localizedDescription)")
            }
        }

        //THEN
        waitForExpectations(timeout: 8) { error in

            if let error = error {
                XCTFail("Error encountred: \(error)")
            } else {
                XCTAssertTrue(isCallSuccess)
            }
        }
    }

    func test_fetch_failure() {

        //GIVEN
        let response = HTTPURLResponse(url: url!,
                                       statusCode: 400,
                                       httpVersion: nil,
                                       headerFields: nil)

        let errorResponse = NSError(domain: "test", code: 400, userInfo: [NSLocalizedDescriptionKey: "error"])
        let expectationService = expectation(description: "RocketListFailure")

        var isCallSuccess = false

        sessionMocked.response = response
        sessionMocked.data = nil
        sessionMocked.error = errorResponse

        sut = WebService(session: sessionMocked)

        //WHEN
        sut.fetch([RocketListServiceResponse].self,
                  from: .rockets) { response in

            switch response {
            case .success(let rockets):
                isCallSuccess = true
                XCTAssertEqual(rockets.count, 12)
                XCTFail("Something goes wrong in: test_fetch_failure()")
            case .failure:
                isCallSuccess = false
                expectationService.fulfill()

            }
        }

        //THEN
        waitForExpectations(timeout: 8) { error in

            if let error = error {
                XCTAssertFalse(isCallSuccess)
                XCTAssertEqual(error.localizedDescription, "error")
            }
        }
    }
}
