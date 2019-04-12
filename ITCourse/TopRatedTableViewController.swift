//
//  TopRatedTableViewController.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 3/11/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit

class TopRatedTableViewController: UITableViewController {
    
    
    //MARK: Properties
    var courses = [Course]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.courses = CourseTableViewController.courses
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.courses = CourseTableViewController.courses
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TopRatedTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TopRatedTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        
        courses.sort(by: { (course0: Course, course1: Course)-> Bool in
            return course0.rating > course1.rating
        })
        
        let c : Course
        c = courses[indexPath.row]
        
        cell.nameLabel.text = c.courseName
        cell.idLabel.text = c.courseID
        
        return cell
    }
}
