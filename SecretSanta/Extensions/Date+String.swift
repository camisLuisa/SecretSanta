//
//  Date+String.swift
//  SecretSanta
//
//  Created by Camila Luísa Farias on 10/07/21.
//  Copyright © 2021 Camila Luisa Farias de Lima. All rights reserved.
//

import Foundation

extension Date {
    func getStringFromDate(formatter: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        let date = dateFormatter.string(from: self)
        
        return date
    }
}

extension String {
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        let date = dateFormatter.date(from:self) ?? Date()
        
        return date
    }
}
