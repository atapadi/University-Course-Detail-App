//
//  FavoriteTableViewController.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 3/11/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    //MARK: Properties
    var courses = [Course]()
    var favCourses = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.courses = CourseTableViewController.courses
        favCourses.reserveCapacity(courses.count)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.courses = CourseTableViewController.courses
        
        favCourses.removeAll()
        for i in 0..<courses.count{
            if courses[i].courseFav == true{
                favCourses.append(courses[i])
            }
        }
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favCourses.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FavoritesTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FavoritesTableViewCell  else {
            fatalError("The dequeued cell is not an instance of CourseTableViewCell.")
        }
        
        
        let c : Course
        c = favCourses[indexPath.row]
        
        cell.nameLabel.text = c.courseName
        cell.idLabel.text = c.courseID
        
        return cell
    }
}
