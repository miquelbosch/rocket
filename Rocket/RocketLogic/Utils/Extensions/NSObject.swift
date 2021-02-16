//
//  NSObjectExtension.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 13/02/2021.
//

import Foundation

extension NSObject {

    static var name: String {
        return String(describing: self)
    }

    static var id: String {
        return name + "ID"
    }
}
