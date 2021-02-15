//
//  WebServiceLocator.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import Foundation

internal final class WebServiceLocator {

    // MARK: - Variables
    private(set) lazy var session = URLSession(configuration: .default)
    private(set) lazy var webService = WebService(session: session)

    // MARK: - Initializers
    public init() {}
}
