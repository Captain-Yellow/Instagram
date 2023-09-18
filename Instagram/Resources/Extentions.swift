//
//  Extentions.swift
//  Instagram
//
//  Created by Mohammad Afshar on 18/09/2023.
//

import Foundation
import UIKit

extension UIView {
    var height: CGFloat {
        frame.size.height
    }
    
    var width: CGFloat {
        frame.size.width
    }
    
    var top: CGFloat {
        frame.origin.y
    }
    
    var bottom: CGFloat {
        frame.origin.y + height
    }
    
    var left: CGFloat {
        frame.origin.x
    }
    
    var right: CGFloat {
        frame.origin.x + width
    }
    
}
