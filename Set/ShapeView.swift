//
//  ShapeView.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 1/17/19.
//  Copyright © 2019 Mobile Apps Kitchen. All rights reserved.
//

import UIKit

class ShapeView: UIView {

    var number: Number? {didSet{setNeedsDisplay()}}
    var shape: Shape? {didSet{setNeedsDisplay()}}
    var color: Color? {didSet{setNeedsDisplay()}}
    var shading: Shading? {didSet{setNeedsDisplay()}}
    
    private func configureView() {
        // TODO: Switch on color
        var drawingColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        if let color = color {
            switch color {
            case .green:
                drawingColor = #colorLiteral(red: 0.2926874757, green: 0.8411405683, blue: 0.3332143426, alpha: 1)
            case .purple:
                drawingColor = #colorLiteral(red: 0.5009863973, green: 0.4916834831, blue: 0.8349262476, alpha: 1)
            case .pink:
                drawingColor = #colorLiteral(red: 1, green: 0, blue: 0.5258871317, alpha: 1)
            }
        }
        // TODO: Switch on number
        if let number = number, let shape = shape, let shading = shading {
            switch number {
            case .one:
                draw(drawingColor, shape: shape, with: shading, in: middleShapeRect)
            case .two:
                draw(drawingColor, shape: shape, with: shading, in: firstShapeOfTwoRect)
                draw(drawingColor, shape: shape, with: shading, in: secondShapeOfTwoRect)
            case .three:
                draw(drawingColor, shape: shape, with: shading, in: firstShapeOfThreeRect)
                draw(drawingColor, shape: shape, with: shading, in: middleShapeRect)
                draw(drawingColor, shape: shape, with: shading, in: thirdShapeRect)
            }
        }
    }
    
    private func draw(_ color: UIColor, shape: Shape, with shading: Shading, in rect: CGRect) {
        var shapePath: UIBezierPath
        // TODO: Switch on shape
        switch shape {
        case .diamond:
           shapePath = UIBezierPath.init(diamondIn: rect)
        case .squiggle:
            shapePath = UIBezierPath.init(squiggleIn: rect)
        case .oval:
            shapePath = UIBezierPath.init(setOvalIn: rect)
        }
        
        color.set()
        
        // TODO: Switch on shading
        switch shading {
        case .filled:
            shapePath.fill()
        case .striped:
            shapePath.stripe(in: rect)
        case .stroked:
            shapePath.stroke()
        }
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
