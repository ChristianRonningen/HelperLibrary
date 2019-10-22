//
//  ViewLine.swift
//
//  Created by Tomas Green on 2018-10-02.
//  Copyright © 2018 Tomas Green. All rights reserved.
//

#if canImport(UIKit)

import UIKit

public struct ViewLine {
    let position:Position
    let color:UIColor
    let size:CGFloat
    let leadingOffset:CGFloat
    let trailingOffset:CGFloat
    var pixelWidth:CGFloat {
        return size / UIScreen.main.scale
    }
    var offset:CGFloat {
        return pixelWidth/2
    }
    
    public enum Position {
        case top
        case bottom
        case left
        case right
        var stringValue:String {
            switch self {
            case .top: return "topLine"
            case .bottom: return "bottomLine"
            case .left: return "leftLine"
            case .right: return "rightLine"
            }
        }
    }
    public init(_ position:Position, color: UIColor, size: CGFloat = 1, leadingOffset:CGFloat = 0, trailingOffset:CGFloat = 0) {
        self.position = position
        self.leadingOffset = leadingOffset
        self.trailingOffset = trailingOffset
        self.color = color
        self.size = size
        
    }
    func apply(to view:UIView) {
        remove(from: view)
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: startPoint(in: view))
        linePath.addLine(to: endPoint(in: view))
        line.path = linePath.cgPath
        line.strokeColor = color.cgColor
        line.lineWidth = pixelWidth
        line.name = position.stringValue
        view.layer.addSublayer(line)
    }
    func remove(from view:UIView) {
        let name = self.position.stringValue
        view.layer.sublayers?.removeAll(where: { (layer) -> Bool in
            return layer.name == name
        })
    }
    func startPoint(in view:UIView) -> CGPoint {
        switch position {
        case .top: return CGPoint(x: leadingOffset, y:  offset)
        case .bottom: return CGPoint(x: leadingOffset, y: view.bounds.size.height - (pixelWidth - offset))
        case .left: return CGPoint(x: offset, y: leadingOffset)
        case .right: return CGPoint(x: view.bounds.size.width - offset, y: leadingOffset)
        }
    }
    func endPoint(in view:UIView) -> CGPoint {
        switch position {
        case .top: return CGPoint(x: view.bounds.size.width - trailingOffset, y: offset)
        case .bottom: return CGPoint(x: view.bounds.size.width - trailingOffset, y: view.bounds.size.height - (pixelWidth - offset))
        case .left: return CGPoint(x: offset, y: view.bounds.size.height - trailingOffset)
        case .right: return CGPoint(x: view.bounds.size.width - offset, y: view.bounds.size.height - trailingOffset)
        }
    }
}

extension UIView {
    func add(line:ViewLine) {
        line.apply(to: self)
    }
    func remove(line atPosition:ViewLine.Position) {
        let name = atPosition.stringValue
        self.layer.sublayers?.removeAll(where: { (layer) -> Bool in
            return layer.name == name
        })
    }
    func removeAllLines() {
        remove(line: .bottom)
        remove(line: .top)
        remove(line: .left)
        remove(line: .right)
    }
}

#endif
