//
//  TimeStamp.swift
//  bonJSONCase
//
//  Created by a27 on 2019-01-15.
//  Copyright © 2019 a27. All rights reserved.
//

import Foundation

import Foundation

struct TimeStamp {
    func getTimeStamp() -> String {
        return Date().iso8601
    }
}

extension Formatter {
    struct Date {
        static let iso8601: DateFormatter = {
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
            return formatter
        }()
    }
}

extension Date {
    var iso8601: String {
        return Formatter.Date.iso8601.string(from: self)
    }
}

extension String {
    var iso8601: Date? {
        return Formatter.Date.iso8601.date(from: self)
    }
}
