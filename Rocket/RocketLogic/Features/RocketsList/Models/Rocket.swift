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
    let firstFlight: String
    let description: String
    let country: String
    let company: String
    let image: String
}

// MARK: - Bind For Response of Rockets Service
internal final class RocketsResponseBinding {

    class func bind(_ rocketsRespone: [RocketListServiceResponse]) -> Rockets {

        //var rockets: [Rocket] = []

        let rockets: [Rocket] = rocketsRespone.map {
            let units = Units(meters: Double(0), feet: Double(0))
            let engines = Engines(number: 0)
            return Rocket(height: $0.height ??  units,
                          engines: $0.engines ?? engines,
                          name: $0.name ??  "-",
                          firstFlight: "Change",
                          description: $0.description ??  "-",
                          country: $0.country ??  "-",
                          company: $0.company ??  "-",
                          image: $0.flickrImages?.first ?? "-")
        }

        return Rockets(rockets: rockets)
    }
}
