//
//  File.swift
//  
//
//  Created by Christian Rönningen on 2019-10-22.
//

import Foundation

public extension SignedInteger {
    /// Returns if int is even
    var isEven: Bool {
        return isMultiple(of: 2) || self == 0
    }
    
    /// Returns if int is odd
    var isOdd: Bool {
        return isEven == false
    }
}
