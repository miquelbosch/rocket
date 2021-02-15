//
//  ServiceError.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import Foundation

// MARK: - Error Manager Enum
public enum ResponseError: LocalizedError {

    case mapping
    case general
    case timeOut
    case server
    case unknow(error: NSError)

    // MARK: - Variables
    public var description: String {
        switch self {
        case .general:
            return "rocket_app_error_general".localize
        case .server:
            return "rocket_app_error_server".localize
        case .mapping:
            return "rocket_app_error_mapping".localize
        case .timeOut:
            return "rocket_app_error_timeOut".localize
        case .unknow(let error):
            return error.localizedDescription
        }
    }
}
