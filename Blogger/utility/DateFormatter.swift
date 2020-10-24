//
//  DateFormatter.swift
//  Blogger
//
//  Created by Prabhakar Patil on 24/10/20.
//

import Foundation

class CustomDateFormatter {
    
    class func utcToLocal(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let localDate = dateFormatter.date(from: date)
        return localDate
    }
}
