//
//  Date.swift
//  task 44
//
//  Created by katia kutsi on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        
        let weekDay =  Calendar.current.dateComponents([.weekday], from: self).weekday
        switch weekDay {
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        case 1:
            return "Sunday"
        default:
            return ""
        }
    }
}
