//
//  File.swift
//  
//
//  Created by Christian Rönningen on 2019-10-22.
//

import Foundation

#if canImport(QuartzCore)
import QuartzCore
#endif

public extension Color {
    
    convenience init(red255: Int, green255: Int, blue255: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red255) / CGFloat(255), green: CGFloat(green255) / CGFloat(255), blue: CGFloat(blue255) / CGFloat(255), alpha: alpha)
    }
    
    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
