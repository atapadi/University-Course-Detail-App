//
//  CourseTableViewController.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 2/22/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit
import os.log


class CourseTableViewController: UITableViewController, UISearchResultsUpdating {

    //MARK: Properties
    public static var courses = [Course]()
    var filteredCourses = [Course]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        
        // Setup the Search Controller
        filteredCourses = CourseTableViewController.courses
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Courses"
        tableView.tableHeaderView = searchController.searchBar
        super.viewDidLoad()
        
        // Load any saved courses, otherwise load sample data.
        if let savedCourses = loadCourses() {
            CourseTableViewController.courses += savedCourses
        }
        else{
            let tabbar = tabBarController as! BaseTabBarController
            // Load the sample data.
            tabbar.loadSampleCourses()
            CourseTableViewController.courses = tabbar.courses
            
        }
        
    }

    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCourses.count
        }
        // #warning Incomplete implementation, return the number of rows
        return CourseTableViewController.courses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CourseTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CourseTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        
        let course: Course
        if isFiltering() {
            course = filteredCourses[indexPath.row]
        } else {
            course = CourseTableViewController.courses[indexPath.row]
        }
        cell.idLabel.text = course.courseID
        cell.nameLabel.text = course.courseName
        //course.courseCount += 1
        
        return cell

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//
//        view.backgroundColor = Theme.current.background
        tableView.reloadData()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        
        case "AddItem":
            os_log("Adding a new course.", log: OSLog.default, type: .debug)
        
        case "ShowDetail":
            guard let courseDetailViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedCourseCell = sender as? CourseTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedCourseCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            //let selectedCourse = courses[indexPath.row]
            let selectedCourse: Course
            if isFiltering(){
                selectedCourse = filteredCourses[indexPath.row]
            }else{
                selectedCourse = CourseTableViewController.courses[indexPath.row]
            }
            
            selectedCourse.courseCount = selectedCourse.courseCount + 1
            
            courseDetailViewController.course = selectedCourse
        
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    
    //MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let course = sourceViewController.course {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
              
                // Update an existing course.
                CourseTableViewController.courses[selectedIndexPath.row] = course
                //update the base course data
                let tabbar = tabBarController as! BaseTabBarController

                tabbar.courses = CourseTableViewController.courses
                
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                
            }
            else {
                
            // Add a new course.
                let newIndexPath = IndexPath(row: CourseTableViewController.courses.count, section: 0)
            
                CourseTableViewController.courses.append(course)

            tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            CourseTableViewController.courses.sort(by: { (course0: Course, course1: Course)-> Bool in
                return course0.courseID < course1.courseID
            })
            
            // Save the courses.
            saveCourses()
            
            tableView.reloadData()
            
        }
    }
        

    
    // MARK: - Private instance methods
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCourses = CourseTableViewController.courses.filter({( course : Course) -> Bool in
            let bool = course.courseName.lowercased().contains(searchText.lowercased())
            let boolean =        course.courseID.lowercased().contains(searchText.lowercased())
            if bool == true{
                return true
            }
            else if boolean == true{
                return true
            }
            else{
                 return false
            }
            
        })
        
        tableView.reloadData()
    }
    
    
    private func saveCourses() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(CourseTableViewController.courses, toFile: Course.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Courses successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save courses...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadCourses() -> [Course]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Course.ArchiveURL.path) as? [Course]
    }
    
}
