//
//  RocketListServiceResponse.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import Foundation

// MARK: - RocketListServiceResponse
struct RocketListServiceResponse: Codable {

    let height: Units?
    let engines: Engines?
    let name: String?
    let firstFlight: String?
    let description: String?
    let country: String?
    let company: String?

    // MARK: - Keys
    enum CodingKeys: String, CodingKey {
        case height
        case engines
        case name
        case firstFlight = "first_flight"
        case description
        case country
        case company
    }
}

struct RocketResponse: Codable {
    let height: Units?
}

// MARK: - Units
struct Units: Codable {
    let meters, feet: Double?
}

// MARK: - Engines
struct Engines: Codable {
    let number: Int?
}
