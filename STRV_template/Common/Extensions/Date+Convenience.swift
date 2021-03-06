//
//  Date+Convenience.swift
//  STRV Project template
//
//  Created by Jakub Kaspar on 05/02/2019.
//  Copyright © 2019 STRV. All rights reserved.
//

import Foundation

extension Date {
    var yesterday: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: noon) ?? self
    }

    var tomorrow: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: noon) ?? self
    }

    var noon: Date {
        Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self) ?? self
    }

    var month: Int {
        Calendar.current.component(.month, from: self)
    }
}

extension Date {
    var isLastDayOfMonth: Bool {
        tomorrow.month != month
    }
}
