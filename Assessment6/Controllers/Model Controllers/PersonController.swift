//
//  PersonController.swift
//  Assessment6
//
//  Created by Nic Gibson on 7/19/19.
//  Copyright © 2019 Nic Gibson. All rights reserved.
//

import Foundation
import CoreData

class PersonController {
    
    // Singleton
    static var sharedInstance = PersonController()
    
    // Source of truth
    var people: [Person] = []
    
    // To make sure that only 2 people are in each gorup, iterate through the array of people and add each to a group, creating a new one if there are already 2 people
    var groups: [[Person]] = []
    
    // MARK: - CRUD Functions
    
    // Create
    func createPersonWith(group: Int16, name: String) {
        Person(group: group, name: name)
        saveToPersistentStore()
    }
    
    // Delete
    func delete(person: Person) {
        if let moc = person.managedObjectContext {
            moc.delete(person)
            saveToPersistentStore()
        }
    }
    
    // Save
    func saveToPersistentStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print ("Error saving to moc: \(error.localizedDescription)")
        }
    }
}
