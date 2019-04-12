//
//  DarkTheme.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 3/13/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit


class DarkTheme: ThemeProtocol {
    var mainFontName: String = "Apple-Chancery"
    var textColor: UIColor = UIColor.white
    var textColorInCell: UIColor = UIColor.black
    var accent: UIColor = UIColor(named: "Background")!
    var background: UIColor = UIColor(named: "Accent")!
    var tint: UIColor = UIColor(named: "Tint")!
}
