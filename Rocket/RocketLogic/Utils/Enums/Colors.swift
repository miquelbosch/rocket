//
//  UIColor.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 13/02/2021.
//

import UIKit

enum Colors {
    case primaryColor
    case secundaryColor

    var get: UIColor? {

        var name: String = ""

        switch self {
        case .primaryColor:
            name = "ColorPrimary"
        case .secundaryColor:
            name = "ColorSecundary"
        }

        return UIColor(named: name)
    }
}
