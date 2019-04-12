//
//  Course.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 2/22/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//
import os.log
import Foundation

class Course: NSObject, NSCoding {
    
    //MARK: Properties
    
    var courseID: String
    var courseName: String
    var courseCount: Int
    var courseDesc: String
    var courseFav: Bool
    var rating: Int
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("courses")
    
    //MARK: Types
    
    struct PropertyKey {
        static let courseID = "ID"
        static let courseName = "name"
        static let courseCount = 0
        static let courseDesc = "description"
        static let courseFav = false
        static let rating = "rating"
    }
    
    //MARK: Initialization
    
    init?(courseID: String, courseName: String, courseDesc: String, courseCount: Int, courseFav: Bool, rating: Int){
        
        // Initialization should fail if there is no name or id
        guard !courseName.isEmpty else{
            return nil
        }
        
        guard !courseID.isEmpty else{
            return nil
        }
        
        guard !courseDesc.isEmpty else{
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.courseCount = courseCount
        self.courseID = courseID
        self.courseName = courseName
        self.courseDesc = courseDesc
        self.courseFav = courseFav
        self.rating = rating
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(courseID, forKey: PropertyKey.courseID)
        aCoder.encode(courseName, forKey: PropertyKey.courseName)
        aCoder.encode(courseDesc, forKey: PropertyKey.courseDesc)
        aCoder.encode(courseCount, forKey: String(PropertyKey.courseCount))
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(courseFav, forKey: String(PropertyKey.courseFav))
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let id = aDecoder.decodeObject(forKey: PropertyKey.courseID) as? String else {
            os_log("Unable to decode the id for a Course object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let name: String = aDecoder.decodeObject(forKey: PropertyKey.courseName) as! String
        let desc: String = aDecoder.decodeObject(forKey: PropertyKey.courseDesc) as! String
        let count = aDecoder.decodeCInt(forKey: String(PropertyKey.courseCount))

        let fav = aDecoder.decodeBool(forKey: String(PropertyKey.courseFav))
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // Must call designated initializer.
        self.init(courseID: id, courseName: name, courseDesc: desc, courseCount: Int(count), courseFav: fav, rating: rating)
    }
}

