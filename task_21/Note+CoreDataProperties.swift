//
//  Note+CoreDataProperties.swift
//  task_21
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var user: User?

    public var wrappedContent: String{
        content ?? "no content"
    }
}
