//
//  Person+Convenience.swift
//  Assessment6
//
//  Created by Nic Gibson on 7/19/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

import Foundation
import CoreData

extension Person {
    @discardableResult
    convenience init(group: Int16, name: String, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.group = group
        self.name = name
    }
}
