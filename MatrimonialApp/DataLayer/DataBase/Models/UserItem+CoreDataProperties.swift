//
//  UserItem+CoreDataProperties.swift
//  MatrimonialApp
//
//  Created by Saurabh Gupta on 29/09/25.
//
//

import Foundation
import CoreData


extension UserItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserItem> {
        return NSFetchRequest<UserItem>(entityName: "UserItem")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var uuid: String?
    @NSManaged public var userData: Data?

}

extension UserItem : Identifiable {

}
