//
//  Constants.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import Foundation

internal struct Constants {

    // MARK: - Global Constants
    struct CrossFeature {
        static let zeroDouble: Double = 0
        static let zeroInt: Int = 0
        static let nilChar: String = "-"
    }

    // MARK: - Rocket Data Constants
    struct RocketDefault {
        static let units = Units(meters: Constants.CrossFeature.zeroDouble, feet: Constants.CrossFeature.zeroDouble)
        static let engines = Engines(number: Constants.CrossFeature.zeroInt)
    }
}
