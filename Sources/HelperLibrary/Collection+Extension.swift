//
//  Collection+Extension.swift
//  
//
//  Created by Christian Rönningen on 2019-10-21.
//

import Foundation

extension Collection {
    func containsMore(than: Int) -> Bool {
        return count > than
    }
    
    func containsMoreOrEqual(to: Int) -> Bool {
        return count >= to
    }
    
    func containsFewer(than: Int) -> Bool {
        return count < than
    }
    
    func containsFewerOrEqual(to: Int) -> Bool {
        return count <= to
    }
    
    func containsEqual(total: Int) -> Bool {
        return count == total
    }
}

extension Array {
    func object(at index: Int) -> Element? {
        guard endIndex > index && index >= 0 else { return nil }
        return self[index]
    }
}
