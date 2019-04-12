//
//  BaseTabBarController.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 3/3/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    var courses = [Course]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: Public Methods
    
    public func loadSampleCourses() {
        guard let course1 = Course(courseID: "IT353", courseName: "Web Development Technologies", courseDesc: "Web concepts, infrastructure, development technologies, multi-tiered program design and implementation, and current issues and trends.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course1")
        }
        
        guard let course2 = Course(courseID: "IT354", courseName: "Advanced Web Application Development", courseDesc: "Theory and practice of state-of-the-art technologies for application development for the Web including service-oriented and mobile systems.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course2")
        }
        
        guard let course3 = Course(courseID: "IT358", courseName: "Mobile and Cloud Computing", courseDesc: "Develop, deploy, and troubleshoot mobile and cloud computing applications.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course3")
        }
        
        guard let course4 = Course(courseID: "IT191", courseName: "Introduction to It Professional Practice", courseDesc: "Researching available positions, interpreting job descriptions, interview skills, preparing a resume, benefits of a Professional Practice experience.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course1")
        }
        
        guard let course5 = Course(courseID: "IT250", courseName: "Fundamentals of Information Assurance and Security", courseDesc: "Fundamental concepts in information assurance and security including planning, risk management, cryptography, network security, hardening, people, and physical security. Formerly IT 350.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course1")
        }
        
        guard let course6 = Course(courseID: "IT351", courseName: "Practical Cryptography and Trusted Systems", courseDesc: "Practical cryptography and its applications, authentication protocols, access controls and trusted systems. Formerly ADVANCED INFORMATION ASSURANCE AND APPLIED CRYPTOGRAPHY.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course2")
        }
        
        guard let course7 = Course(courseID: "IT276", courseName: "Data Communications", courseDesc: "Hardware and software used in data communications and networking. Network types, architectures, protocols and standards. Local area and packet networks. Formerly IT 375.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course2")
        }
        
        guard let course8 = Course(courseID: "IT391", courseName: "Directed Project In Information Technology", courseDesc: "Team design and/or implementation of a modest-sized computer-based system in a live environment under faculty supervision. May be repeated; maximum 16 hours combined credit in IT 298, 391 and 398.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course1")
        }
        
        guard let course9 = Course(courseID: "IT261", courseName: "Systems Development I", courseDesc: "Information systems development, development methodologies, analysis and design techniques and tools, relational database concepts.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course1")
        }
        
        guard let course10 = Course(courseID: "IT388", courseName: "Introduction To Parallel Processing", courseDesc: "Study of parallel processors and their software environments. Students will write programs for several parallel computers. Offered alternate years.", courseCount: 0, courseFav: false, rating: 0) else {
            fatalError("Unable to instantiate course1")
        }
        
        
        courses += [course1, course2, course3, course4, course5, course6, course7, course8, course9, course10]
        
        courses.sort(by: { (course0: Course, course1: Course)-> Bool in
            return course0.courseID < course1.courseID
        })
    }
    

}
