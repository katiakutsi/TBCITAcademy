//
//  UDManager.swift
//  task_17
//
//  Created by katia kutsi on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

class UDManager {
    
    static let SEGMENT_INDEX_KEY = "SEGMENT_INDEX_KEY"
    
    static func getUD() -> UserDefaults{
        return UserDefaults.standard
    }
    
    static func saveSegmentIndex(value: Int) {
        getUD().set(value, forKey: SEGMENT_INDEX_KEY)
    }
    
    static func getSegmentIndex() -> Int {
        return getUD().integer(forKey: SEGMENT_INDEX_KEY)
    }
}
