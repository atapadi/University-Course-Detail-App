//
//  SettingsViewController.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 3/11/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: Properties
    var courses = [Course]()
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var deleteFavLabel: UILabel!
    
    //MARK: Private Actions
    @IBAction func deleteButton(_ sender: UIButton) {
        let tabbar = tabBarController as! BaseTabBarController
        courses = tabbar.courses
        for i in 0..<courses.count{
            if courses[i].courseFav == true{
                courses[i].courseFav = false
            }
        }
    }
    @IBAction func notificationButton(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyTheme()
    }
    
    @IBAction func themeChanged(_ sender: UISwitch) {
        if sender.isOn{
            Theme.current = LightTheme()
        }
        else{
            Theme.current = DarkTheme()
        }
        
        UserDefaults.standard.set(sender.isOn, forKey: "LightTheme")
        applyTheme()
    }
    
    fileprivate func applyTheme(){
        view.backgroundColor = Theme.current.background
        themeLabel.textColor = Theme.current.textColor
        notificationLabel.textColor = Theme.current.textColor
        deleteFavLabel.textColor = Theme.current.textColor
        
    }
    

}
