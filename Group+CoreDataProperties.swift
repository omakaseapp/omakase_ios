//
//  Group+CoreDataProperties.swift
//  Omakase
//
//  Created by Hanzheng Li on 1/5/21.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var emoji: String?
    @NSManaged public var name: String?
    @NSManaged public var members: NSOrderedSet?

}

// MARK: Generated accessors for members
extension Group {

    @objc(insertObject:inMembersAtIndex:)
    @NSManaged public func insertIntoMembers(_ value: Friend, at idx: Int)

    @objc(removeObjectFromMembersAtIndex:)
    @NSManaged public func removeFromMembers(at idx: Int)

    @objc(insertMembers:atIndexes:)
    @NSManaged public func insertIntoMembers(_ values: [Friend], at indexes: NSIndexSet)

    @objc(removeMembersAtIndexes:)
    @NSManaged public func removeFromMembers(at indexes: NSIndexSet)

    @objc(replaceObjectInMembersAtIndex:withObject:)
    @NSManaged public func replaceMembers(at idx: Int, with value: Friend)

    @objc(replaceMembersAtIndexes:withMembers:)
    @NSManaged public func replaceMembers(at indexes: NSIndexSet, with values: [Friend])

    @objc(addMembersObject:)
    @NSManaged public func addToMembers(_ value: Friend)

    @objc(removeMembersObject:)
    @NSManaged public func removeFromMembers(_ value: Friend)

    @objc(addMembers:)
    @NSManaged public func addToMembers(_ values: NSOrderedSet)

    @objc(removeMembers:)
    @NSManaged public func removeFromMembers(_ values: NSOrderedSet)

}

extension Group : Identifiable {

}
