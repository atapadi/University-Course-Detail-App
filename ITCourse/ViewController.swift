//
//  ViewController.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 2/22/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit
import os.log
class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var CourseIDText: UITextField!
    @IBOutlet weak var CourseNameText: UITextField!
    @IBOutlet weak var courseDescText: UITextView!
    @IBOutlet weak var CourseCountText: UILabel!
    public static var CourseFav1: Bool = false
    @IBOutlet weak var CourseFav: UISwitch!
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func switchFav(_ sender: UISwitch) {
        if sender.isOn{
            ViewController.CourseFav1 = true
        }
        else{
            ViewController.CourseFav1 = false
        }
        
    }
    
    /*
     This value is either passed by `CourseTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new course.
     */
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up views if editing an existing Course.
        if let course = course {
            navigationItem.title = course.courseID
            CourseNameText.text   = course.courseName
            CourseIDText.text = course.courseID
            courseDescText.text = course.courseDesc
            ratingControl.rating = course.rating
            if course.courseFav == true{
                CourseFav.setOn(true, animated: true)
            }
            CourseCountText.text = String(course.courseCount)
            //saveButton.isEnabled = false
        }
        
    }
    
    //MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddCourseMode = presentingViewController is UINavigationController
        
        if isPresentingInAddCourseMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The ViewController is not inside a navigation controller.")
        }
    }
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let courseID = CourseIDText.text ?? ""
        let courseName = CourseNameText.text ?? ""
        let courseDesc = courseDescText.text ?? ""
        let courseFav = ViewController.CourseFav1
        let courseRating = ratingControl.rating
        let courseCount: Int = Int(CourseCountText.text ?? "0")!
        
        // Set the course to be passed to CourseTableViewController after the unwind segue.
        course = Course(courseID: courseID, courseName: courseName, courseDesc: courseDesc, courseCount: courseCount, courseFav: courseFav, rating: courseRating)
    }
    
}

