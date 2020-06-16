//
//  NotificationCenter.swift
//  task 41
//
//  Created by katia kutsi on 6/17/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

extension NSNotification.Name{
    static let InfoID = NSNotification.Name("info_id")
}

@objc extension NSNotification {
    public static let didRecieveInfo = Notification.Name.InfoID
}
