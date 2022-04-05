//
//  DateConvertor.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation

public struct DateConvertor {
    public static func dateStringFrom(timeStamp: Int, withDateFormatter dateFormatter: DateFormatter) -> String {
        let timeStampTimeInterval = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeStampTimeInterval)
        return dateFormatter.string(from: date)
    }
}
