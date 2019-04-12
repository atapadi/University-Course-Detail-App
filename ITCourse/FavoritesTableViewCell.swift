//
//  FavoritesTableViewCell.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 3/11/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
