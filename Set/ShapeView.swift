//
//  ShapeView.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 1/17/19.
//  Copyright © 2019 Mobile Apps Kitchen. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    var number: NumberOfSymbols? {didSet{setNeedsDisplay()}}
    var shape: Symbol? {didSet{setNeedsDisplay()}}
    var color: Color? {didSet{setNeedsDisplay()}}
    var shading: Shading? {didSet{setNeedsDisplay()}}
    
    var firstShapePath = UIBezierPath()
    var secondShapePath = UIBezierPath()
    var thirdShapePath = UIBezierPath()
    
    private func configureView() {
        // TODO: Switch on shape
        
        // TODO: Switch on number
        
        // TODO: Switch on color
        
        // TODO: Switch on shading
    }
    
    override func draw(_ rect: CGRect) {
        configureView()
        
        // TODO: Draw shapes
    }

}

extension ShapeView {
    struct SizeRatio {
        static let shapeViewWidthToBoundsWidth: CGFloat = 0.625
        static let shapeViewHeightToBoundsHeight: CGFloat = 0.6
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let xOffsetToBoundsWidth: CGFloat = 0.2
        static let yOffsetToBoundsHeight: CGFloat = 0.1875
        static let shapeRectHeightToShapesViewHeight: CGFloat = 0.3
        static let spaceInBetweenShapesToShapesViewHeight: CGFloat = 0.05
        static let spaceBeforeAndAfterTwoShapesToShapesViewHeight: CGFloat = 0.175
        static let spaceBeforeAndAfterOneShapeToShapesViewHeight: CGFloat = 0.35
    }
    
    private var shapeRectHeight: CGFloat {
        return bounds.height * SizeRatio.shapeRectHeightToShapesViewHeight
    }
    
    private var spaceBetweenShapesHeight: CGFloat {
        return bounds.height * SizeRatio.spaceInBetweenShapesToShapesViewHeight
    }
    
    private var spaceBeforeAndAfterOneShapeHeight: CGFloat {
        return bounds.height * SizeRatio.spaceBeforeAndAfterOneShapeToShapesViewHeight
    }
    
    private var spaceBeforeAndAfterTwoShapesHeight: CGFloat {
        return bounds.height * SizeRatio.spaceBeforeAndAfterTwoShapesToShapesViewHeight
    }
    
    private var firstShapeOfThreeRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: shapeRectHeight)
    }
    
    private var middleShapeRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y + shapeRectHeight + spaceBetweenShapesHeight, width: bounds.width, height: bounds.height * SizeRatio.shapeRectHeightToShapesViewHeight)
    }
    
    private var thirdShapeRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y + (2 * shapeRectHeight) + (2 * spaceBetweenShapesHeight), width: bounds.width, height: bounds.height * SizeRatio.shapeRectHeightToShapesViewHeight)
    }
    
    private var firstShapeOfTwoRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y + spaceBeforeAndAfterTwoShapesHeight, width: bounds.width, height: bounds.height * SizeRatio.shapeRectHeightToShapesViewHeight)
    }
    
    private var secondShapeOfTwoRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y + spaceBeforeAndAfterTwoShapesHeight + shapeRectHeight + spaceBetweenShapesHeight, width: bounds.width, height: bounds.height * SizeRatio.shapeRectHeightToShapesViewHeight)
    }
}

extension CGRect {
    var leftHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    var rightHalf: CGRect {
        return CGRect(x: midX, y: minY, width: width/2, height: height)
    }
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    func sized(to size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
    }
}


extension UIBezierPath {
    
    convenience init(diamondIn rect: CGRect) {
        self.init()
        let diamondRect = rect.zoom(by: 0.85)
        self.move(to: CGPoint(x: diamondRect.midX, y: diamondRect.minY))
        self.addLine(to: CGPoint(x: diamondRect.maxX, y: diamondRect.midY))
        self.addLine(to: CGPoint(x: diamondRect.midX, y: diamondRect.maxY))
        self.addLine(to: CGPoint(x: diamondRect.minX, y: diamondRect.midY))
        self.close()
    }
    
    convenience init(setOvalIn rect: CGRect) {
        let ovalRect = rect.zoom(by: 0.85)
        self.init(roundedRect: ovalRect, cornerRadius: 100)
    }
    
    convenience init(squiggleIn rect: CGRect) {
        self.init()
        let squigglRect = rect.zoom(by: 0.9)
        
        self.move(to: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.05, y: squigglRect.origin.y + squigglRect.size.height*0.40))

        self.addCurve(to: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.35, y: squigglRect.origin.y + squigglRect.size.height*0.25),
                      controlPoint1: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.09, y: squigglRect.origin.y + squigglRect.size.height*0.15),
                      controlPoint2: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.18, y: squigglRect.origin.y + squigglRect.size.height*0.10))

        self.addCurve(to: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.75, y: squigglRect.origin.y + squigglRect.size.height*0.30),
                      controlPoint1: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.40, y: squigglRect.origin.y + squigglRect.size.height*0.30),
                      controlPoint2: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.60, y: squigglRect.origin.y + squigglRect.size.height*0.45))

        self.addCurve(to: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.97, y: squigglRect.origin.y + squigglRect.size.height*0.35),
                      controlPoint1: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.87, y: squigglRect.origin.y + squigglRect.size.height*0.15),
                      controlPoint2: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.98, y: squigglRect.origin.y + squigglRect.size.height*0.00))

        self.addCurve(to: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.45, y: squigglRect.origin.y + squigglRect.size.height*0.85),
                      controlPoint1: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.95, y: squigglRect.origin.y + squigglRect.size.height*1.10),
                      controlPoint2: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.50, y: squigglRect.origin.y + squigglRect.size.height*0.95))

        self.addCurve(to: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.25, y: squigglRect.origin.y + squigglRect.size.height*0.85),
                      controlPoint1: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.40, y: squigglRect.origin.y + squigglRect.size.height*0.80),
                      controlPoint2: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.35, y: squigglRect.origin.y + squigglRect.size.height*0.75))

        self.addCurve(to: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.05, y: squigglRect.origin.y + squigglRect.size.height*0.40),
                      controlPoint1: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.00, y: squigglRect.origin.y + squigglRect.size.height*1.10),
                      controlPoint2: CGPoint(x: squigglRect.origin.x + squigglRect.size.width*0.005, y: squigglRect.origin.y + squigglRect.size.height*0.60))
        
        self.close()
    }
    
    func stripe(in rect: CGRect) {
        self.addClip()
        for i in stride(from: 0.0, through: Double(rect.size.width), by: 5.0) {
            self.move(to: CGPoint(x: rect.origin.x + CGFloat(i), y: rect.origin.y))
            self.addLine(to: CGPoint(x: rect.origin.x + CGFloat(i), y: rect.origin.y + rect.size.height))
        }
        self.stroke()
    }
}