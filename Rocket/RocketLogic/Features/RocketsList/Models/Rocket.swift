//
//  Rocket.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 14/02/2021.
//

import Foundation

struct Rockets {
    let rockets: [Rocket]
}

struct Rocket {

    let height: Units
    let engines: Engines
    let name: String
    let firstFlight: Date
    let description: String
    let country: String
    let company: String
    let image: String
}

// MARK: - Bind For Response of Rockets Service
internal final class RocketsResponseBinding {

    class func bind(_ rocketsRespone: [RocketListServiceResponse]) -> Rockets {

        let rockets: [Rocket] = rocketsRespone.map {
            let defaultUnits = Constants.RocketDefault.units
            let defaultengines = Constants.RocketDefault.engines
            let firstFlight =  $0.firstFlight ?? Constants.CrossFeature.nilChar
            return Rocket(height: $0.height ?? defaultUnits,
                          engines: $0.engines ?? defaultengines,
                          name: $0.name ?? Constants.CrossFeature.nilChar,
                          firstFlight: DateManager.date(original: firstFlight, to: .yyyyMMdd),
                          description: $0.description ?? Constants.CrossFeature.nilChar,
                          country: $0.country ?? Constants.CrossFeature.nilChar,
                          company: $0.company ?? Constants.CrossFeature.nilChar,
                          image: $0.flickrImages?.first ?? Constants.CrossFeature.nilChar)
        }

        return Rockets(rockets: rockets)
    }
}
