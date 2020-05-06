//
//  UDManager.swift
//  task16
//
//  Created by katia kutsi on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

class UDManager{
    static let KEY_LOG_OUT = "KEY_FOR_LOG_OUT"
    static let KEY_LETTER = "LETTER"
    static let KEY_SEGMENT_INDEX = "KEY_SEGMENT_INDEX"
    
    static func getUD() -> UserDefaults{
        return UserDefaults.standard
    }
    
    static func tappedOnLogOut(){
        return getUD().set(true, forKey:KEY_LOG_OUT)
    }
    
    static func untappedOnLogOut(){
        return getUD().set(false, forKey: KEY_LOG_OUT)
    }
    
    static func tappedOrNotOnLogOut() -> Bool {
        return getUD().bool(forKey: KEY_LOG_OUT)
    }

    static func saveLetter(value : String) {
        return getUD().set(value, forKey: KEY_LETTER)
    }
    
    static func getLetter()->String{
        return getUD().string(forKey: KEY_LETTER) ?? ""
    }
    
    static func saveSegmentIndex(value : Int){
        return getUD().set(value, forKey: KEY_SEGMENT_INDEX)
    }
    
    static func getSegmentIndex() -> Int{
        return getUD().integer(forKey: KEY_SEGMENT_INDEX)
    }

}
