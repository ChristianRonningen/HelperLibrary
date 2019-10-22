//
//  File.swift
//  
//
//  Created by Christian Rönningen on 2019-10-22.
//  Copyright © 2019 Christian Rönningen. All rights reserved.
//

import Foundation

#if canImport(UIKit)

import UIKit

public typealias View = UIView
public typealias EdgeInsets = UIEdgeInsets
public typealias Screen = UIScreen
public typealias Color = UIColor
public typealias BezierPath = UIBezierPath

#elseif canImport(AppKit)

import AppKit

public typealias View = NSView
public typealias EdgeInsets = NSEdgeInsets
public typealias Screen = NSScreen
public typealias Color = NSColor
public typealias BezierPath = NSBezierPath

#endif
