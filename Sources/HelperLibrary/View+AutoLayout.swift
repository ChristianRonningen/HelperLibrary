//
//  UIView+AutoLayout.swift
//  
//
//  Created by Christian Rönningen on 2019-10-21.
//

import Foundation

#if canImport(UIKit)
import UIKit
typealias View = UIView
public typealias EdgeInsets = UIEdgeInsets
#elseif canImport(AppKit)
import AppKit
typealias View = NSView
public typealias EdgeInsets = NSEdgeInsets

public extension NSEdgeInsets {
    static let zero = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}
#endif

// MARK: Fill superview
public extension View {
    /// Matches width and height to superview and centers it
    /// - Parameter activated: Should the constaint be activated directly
    func fillSuperview(activated: Bool = true) -> [NSLayoutConstraint] {
        return [
            matchWidthToSuperview(activated),
            matchHeightToSuperview(activated),
            centerXInSuperview(activated),
            centerYInSuperview(activated)
        ].compactMap({ $0 })
    }
    
    func matchWidthToSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = widthAnchor.constraint(equalTo: superview.widthAnchor)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1, constant: 0)
        }

        constraint.isActive = activated
        return constraint
    }
    
    func matchHeightToSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = heightAnchor.constraint(equalTo: superview.heightAnchor)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1, constant: 0)
        }
        
        constraint.isActive = activated
        return constraint
    }
    
    func centerXInSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0)
        }
        
        constraint.isActive = activated
        return constraint
    }
    
    func centerYInSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: 0)
        }
        
        constraint.isActive = activated
        return constraint
    }
}

// MARK: Constrain to superview
public extension View {
    func constraintToSuperView(activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        return [
            constraintToSuperViewLeft(activated, inset: inset.left),
            constraintToSuperViewTop(activated, inset: inset.top),
            constraintToSuperViewRight(activated, inset: inset.right),
            constraintToSuperViewBottom(activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }

    func constraintToSuperViewLeft(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }

        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewRight(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewBottom(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewTop(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
}


// MARK: Constraint to margins
#if canImport(UIKit)
@available(iOS 11.0, *)
public extension View {
    func constraintToSuperViewMargins(activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        return [
            constraintToSuperViewLeftMargin(activated, inset: inset.left),
            constraintToSuperViewTopMargin(activated, inset: inset.top),
            constraintToSuperViewRightMargin(activated, inset: inset.right),
            constraintToSuperViewBottomMargin(activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }

    func constraintToSuperViewLeftMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }

        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, *) {
            constraint = leftAnchor.constraint(equalTo: superview.layoutMarginsGuide.leftAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .leftMargin, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewRightMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, *) {
            constraint = rightAnchor.constraint(equalTo: superview.layoutMarginsGuide.rightAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .rightMargin, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewBottomMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, *) {
            constraint = bottomAnchor.constraint(equalTo: superview.layoutMarginsGuide.bottomAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottomMargin, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewTopMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, *) {
            constraint = topAnchor.constraint(equalTo: superview.layoutMarginsGuide.topAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .topMargin, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
}
#endif

// MARK: Constrain to safearea
#if canImport(UIKit)
@available(iOS 11.0, *)
public extension View {
    func constraintToSuperViewSafeArea(activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        return [
            constraintToSuperViewSafeAreaLeft(activated, inset: inset.left),
            constraintToSuperViewSafeAreaTop(activated, inset: inset.top),
            constraintToSuperViewSafeAreaRight(activated, inset: inset.right),
            constraintToSuperViewSafeAreaBottom(activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }

    func constraintToSuperViewSafeAreaLeft(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }

        let constraint = leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewSafeAreaTop(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }

        let constraint = topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewSafeAreaRight(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }

        let constraint = rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    func constraintToSuperViewSafeAreaBottom(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }

        let constraint = bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
}
#endif


public extension NSLayoutConstraint {
    func activate() -> Self {
        isActive = true
        return self
    }
    
    func deactivate() -> Self {
        isActive = false
        return self
    }
}
