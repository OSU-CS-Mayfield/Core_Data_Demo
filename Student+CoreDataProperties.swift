//
//  Student+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Blayne Mayfield on 2/22/22.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var studentID: Int32
    @NSManaged public var totalPoints: Int64
    @NSManaged public var courses: NSSet?

}

// MARK: Generated accessors for courses
extension Student {

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: Course)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: Course)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSSet)

}

extension Student : Identifiable {

}
