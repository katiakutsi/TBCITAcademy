//
//  User+CoreDataProperties.swift
//  task_21
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var note: NSSet?

    public var wrappedUsername: String{
        username ?? "no username"
    }
    public var wrappedPassword: String{
        password ?? "no password"
    }
    
    public var notesArray: [String] {
        get{
        let set = note as? Set<String> ?? []
        
            return set.sorted()
        }set {
            notesArray = newValue
        }
    }
}

// MARK: Generated accessors for note
extension User {

    @objc(addNoteObject:)
    @NSManaged public func addToNote(_ value: Note)

    @objc(removeNoteObject:)
    @NSManaged public func removeFromNote(_ value: Note)

    @objc(addNote:)
    @NSManaged public func addToNote(_ values: NSSet)

    @objc(removeNote:)
    @NSManaged public func removeFromNote(_ values: NSSet)

}
