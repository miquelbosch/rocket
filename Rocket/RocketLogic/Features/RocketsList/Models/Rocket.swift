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

    let height: String
    let engines: String
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

            let height = heightToString(height: $0.height?.meters)
            let firstFlight =  $0.firstFlight ?? Constants.CrossFeature.nilChar
            return Rocket(height: height,
                          engines: $0.engines?.number?.toString ?? Constants.CrossFeature.nilChar,
                          name: $0.name ?? Constants.CrossFeature.nilChar,
                          firstFlight: DateManager.date(original: firstFlight, to: .yyyyMMdd),
                          description: $0.description ?? Constants.CrossFeature.nilChar,
                          country: $0.country ?? Constants.CrossFeature.nilChar,
                          company: $0.company ?? Constants.CrossFeature.nilChar,
                          image: $0.flickrImages?.first ?? Constants.CrossFeature.nilChar)
        }

        return Rockets(rockets: rockets)
    }

    private class func heightToString(height: Double?) -> String {

        guard let height = height else {
            return Constants.CrossFeature.nilChar
        }

        return  String(height) + Constants.CrossFeature.centimeters
    }
}
