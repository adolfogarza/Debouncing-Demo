//
//  RandomColor.swift
//  Debouncing-Demo
//
//  Created by Adolfo Garza on 9/24/18.
//  Copyright © 2018 Adolfo Garza. All rights reserved.
//

import Foundation
import UIKit

struct RandomColor {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    static func generateRandomColor() -> UIColor {
        return UIColor(red: random(), green: random(), blue: random(), alpha: 1.0)
    }
}
