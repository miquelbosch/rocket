//
//  Endpoint.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import Foundation

internal enum HTTPMehtod: String {
    case get = "GET"
}

internal enum Endpoint {
    case rockets

    var method: HTTPMehtod {
        switch self {
        case .rockets:
            return .get
        }
    }

    var path: String {
        switch self {
        case .rockets:
            return "rockets"
        }
    }
}

internal extension Endpoint {

    func request(with base: URL) -> URLRequest {

        let urlPath = base.appendingPathComponent(path)
        var request = URLRequest(url: urlPath)
        request.httpMethod = method.rawValue
        return request
    }
}
