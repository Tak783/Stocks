//
//  DateFormatter+Extensions.swift
//  
//
//  Created by Tak Mazarura on 05/04/2022.
//

import Foundation

public extension DateFormatter {
    /// Returns a short style date/time formatter in user's locale.  E.g., 07/11/2016, 16:37
    static let shortStyleDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
