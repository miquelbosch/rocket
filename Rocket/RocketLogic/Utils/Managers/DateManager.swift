//
//  DateManager.swift
//  RocketLogic
//
//  Created by Miquel Bosch on 15/02/2021.
//

import Foundation

enum DateFormat: String {
    case ddMMyyyy = "dd/MM/yyyy"
    case yyyyMMdd = "yyyy-MM-dd"
}

// MARK: - DateManager
final class DateManager {

    class func date(original: String, to format: DateFormat) -> Date {

        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.date(from: original) ?? Date()
    }

    class func date(original: Date, to format: DateFormat) -> String {

        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: original)
    }
}
