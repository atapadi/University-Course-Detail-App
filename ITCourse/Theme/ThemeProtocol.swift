//
//  ThemeProtocol.swift
//  ITCourse
//
//  Created by Akanksha Tapadia on 3/13/19.
//  Copyright © 2019 Akanksha Tapadia. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    var mainFontName: String {get}
    var textColor: UIColor {get}
    var textColorInCell: UIColor {get}
    var accent: UIColor {get}
    var background: UIColor {get}
    var tint: UIColor {get}
}
