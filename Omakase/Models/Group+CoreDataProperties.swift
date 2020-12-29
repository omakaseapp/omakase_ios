//
//  Group+CoreDataProperties.swift
//  Omakase
//
//  Created by Hanzheng Li on 12/29/20.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var friends: [Friend]?
    @NSManaged public var name: String?

}

extension Group : Identifiable {

}
