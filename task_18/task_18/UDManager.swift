//
//  UDManager.swift
//  task_18
//
//  Created by katia kutsi on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
class UDManager{
    static let KEY_NOTE_PAGE = "KEY_NOTE_PAGE"
    
    static func getUD()->UserDefaults{
        return UserDefaults.standard
    }
    
    static func saveNotePage(){
        return getUD().set(true, forKey: KEY_NOTE_PAGE)
    }
    
    static func notePageKeyValue()->Bool{
        return getUD().bool(forKey: KEY_NOTE_PAGE)
    }
}
