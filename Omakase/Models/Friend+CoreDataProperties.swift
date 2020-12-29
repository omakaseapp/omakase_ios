//
//  Friend+CoreDataProperties.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/29/20.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var profilePhoto: Data?

}

extension Friend : Identifiable {

}
