//
//  CourseTableViewCell.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 2/22/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        idLabel.font = UIFont(name: Theme.current.mainFontName, size: 20)
        nameLabel.font = UIFont(name: Theme.current.mainFontName, size: 20)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        idLabel.backgroundColor = Theme.current.accent
        nameLabel.backgroundColor = Theme.current.accent
        idLabel.textColor = Theme.current.textColorInCell
        nameLabel.textColor = Theme.current.textColorInCell
    }

}
