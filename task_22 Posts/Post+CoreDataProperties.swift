//
//  Post+CoreDataProperties.swift
//  task_22
//
//  Created by katia kutsi on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var user: User?

}
