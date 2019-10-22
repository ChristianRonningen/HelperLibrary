//
//  UIView+AutoLayout.swift
//  
//
//  Created by Christian Rönningen on 2019-10-21.
//

import Foundation

#if canImport(UIKit)
import UIKit
public typealias View = UIView
public typealias EdgeInsets = UIEdgeInsets
#elseif canImport(AppKit)
import AppKit
public typealias View = NSView
public typealias EdgeInsets = NSEdgeInsets

public extension NSEdgeInsets {
    static let zero = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}
#endif

// MARK: Fill superview
public extension View {
    /// Matches width and height to superview and centers it
    /// - Parameter activated: Should the constaint be activated directly
    @discardableResult
    func fillSuperview(activated: Bool = true) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        return [
            matchWidthToSuperview(activated),
            matchHeightToSuperview(activated),
            centerXInSuperview(activated),
            centerYInSuperview(activated)
        ].compactMap({ $0 })
    }
    
    @discardableResult
    func matchWidthToSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = widthAnchor.constraint(equalTo: superview.widthAnchor)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: 1, constant: 0)
        }

        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func matchHeightToSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = heightAnchor.constraint(equalTo: superview.heightAnchor)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: 1, constant: 0)
        }
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func centerXInSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: 0)
        }
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func centerYInSuperview(_ activated: Bool = true) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
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
    @discardableResult
    func constraintToSuperView(activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        translatesAutoresizingMaskIntoConstraints = false
        
        return [
            constraintToSuperViewLeft(activated, inset: inset.left),
            constraintToSuperViewTop(activated, inset: inset.top),
            constraintToSuperViewRight(activated, inset: inset.right),
            constraintToSuperViewBottom(activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }

    @discardableResult
    func constraintToSuperViewLeft(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false

        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: superview, attribute: .left, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewRight(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: superview, attribute: .right, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewBottom(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewTop(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    //
    @discardableResult
    func constraint(to view: View, activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        translatesAutoresizingMaskIntoConstraints = false
        
        return [
            constraintLeft(of: view, activated: activated, inset: inset.left),
            constraintTop(of: view, activated: activated, inset: inset.top),
            constraintRight(of: view, activated: activated, inset: inset.right),
            constraintBottom(of: view, activated: activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }

    @discardableResult
    func constraintLeft(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false

        let constraint: NSLayoutConstraint
        
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = leftAnchor.constraint(equalTo: view.leftAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintRight(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = rightAnchor.constraint(equalTo: view.rightAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintBottom(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintTop(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint: NSLayoutConstraint
        if #available(iOS 9.0, OSX 10.11, *) {
            constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: inset)
        } else {
            constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: inset)
        }
    
        constraint.isActive = activated
        return constraint
    }
}


// MARK: Constraint to margins
#if canImport(UIKit)
@available(iOS 11.0, *)
public extension View {
    @discardableResult
    func constraintToSuperViewMargins(activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        translatesAutoresizingMaskIntoConstraints = false
        
        return [
            constraintToSuperViewLeftMargin(activated, inset: inset.left),
            constraintToSuperViewTopMargin(activated, inset: inset.top),
            constraintToSuperViewRightMargin(activated, inset: inset.right),
            constraintToSuperViewBottomMargin(activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }
    
    @discardableResult
    func constraintMargins(of view: View, activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        translatesAutoresizingMaskIntoConstraints = false
        
        return [
            constraintLeftMargin(of: view, activated: activated, inset: inset.left),
            constraintTopMargin(of: view, activated: activated, inset: inset.top),
            constraintRightMargin(of: view, activated: activated, inset: inset.right),
            constraintBottomMargin(of: view, activated: activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }
    
    @discardableResult
    func constraintLeftMargin(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
     
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }

    @discardableResult
    func constraintToSuperViewLeftMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = leftAnchor.constraint(equalTo: superview.layoutMarginsGuide.leftAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintRightMargin(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor, constant: -inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewRightMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = rightAnchor.constraint(equalTo: superview.layoutMarginsGuide.rightAnchor, constant: -inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintBottomMargin(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewBottomMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = bottomAnchor.constraint(equalTo: superview.layoutMarginsGuide.bottomAnchor, constant: -inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintTopMargin(of view: View, activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewTopMargin(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = topAnchor.constraint(equalTo: superview.layoutMarginsGuide.topAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
}
#endif

// MARK: Constrain to safearea
#if canImport(UIKit)
@available(iOS 11.0, *)
public extension View {
    @discardableResult
    func constraintToSuperViewSafeArea(activated: Bool = true, with inset: EdgeInsets = .zero) -> [NSLayoutConstraint]? {
        translatesAutoresizingMaskIntoConstraints = false
        
        return [
            constraintToSuperViewSafeAreaLeft(activated, inset: inset.left),
            constraintToSuperViewSafeAreaTop(activated, inset: inset.top),
            constraintToSuperViewSafeAreaRight(activated, inset: inset.right),
            constraintToSuperViewSafeAreaBottom(activated, inset: inset.bottom)
        ].compactMap({ $0 })
    }

    @discardableResult
    func constraintToSuperViewSafeAreaLeft(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewSafeAreaTop(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewSafeAreaRight(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor, constant: inset)
        
        constraint.isActive = activated
        return constraint
    }
    
    @discardableResult
    func constraintToSuperViewSafeAreaBottom(_ activated: Bool = true, inset: CGFloat = 0.0) -> NSLayoutConstraint? {
        guard let superview = self.superview else { return nil }
        
        translatesAutoresizingMaskIntoConstraints = false

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
