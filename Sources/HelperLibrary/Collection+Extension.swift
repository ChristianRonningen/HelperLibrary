//
//  Collection+Extension.swift
//  
//
//  Created by Christian Rönningen on 2019-10-21.
//

import Foundation

extension Collection {
    func isMore(then: Int) -> Bool {
        return count > then
    }
    
    func isMoreOrEqual(to: Int) -> Bool {
        return count >= to
    }
    
    func isFewer(then: Int) -> Bool {
        return count < then
    }
    
    func isFewerOrEqual(to: Int) -> Bool {
        return count <= to
    }
    
    func equals(total: Int) -> Bool {
        return count == total
    }
}
