//
//  Student+CoreDataClass.swift
//  Core Data Demo
//
//  Created by Blayne Mayfield on 2/22/22.
//
//

import Foundation
import CoreData

@objc(Student)
public class Student: NSManagedObject {
    func nameAndID() -> String {
        self.name! + " " + String(self.studentID)
    }
}
