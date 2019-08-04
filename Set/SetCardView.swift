//
//  SetCardView.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 1/9/19.
//  Copyright © 2019 Mobile Apps Kitchen. All rights reserved.
//

import UIKit

class SetCardView: UIView {
    
    var number: Number? {didSet{setNeedsDisplay()}}
    var shape: Shape? {didSet{setNeedsDisplay()}}
    var color: Color? {didSet{setNeedsDisplay()}}
    var shading: Shading? {didSet{setNeedsDisplay()}}
    
    private lazy var shapeView = createShapeView()

    private func createShapeView() -> UIView {
        let view = UIView()
        addSubview(view)
        return view
    }
    
    private func configureShapesView(_ view: UIView) {
        view.isOpaque = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        view.frame = shapeViewFrame
        
        number = .three
        shape = .diamond
        color = .purple
        shading = .striped
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureShapesView(shapeView)
    }
    
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
            shapePath.lineWidth = 1.5
            shapePath.stripe(in: rect)
        case .stroked:
            shapePath.lineWidth = 2.0
            shapePath.stroke()
        }
    }
    
    private func drawCard() {
        let card = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        UIColor.white.setFill()
        card.fill()
    }
    
    override func draw(_ rect: CGRect) {
        drawCard()
        configureView()
    }
}

extension SetCardView {
    struct SizeRatio {
        static let cardViewAspectRatio: CGFloat = 5 / 8
        static let cardViewInsetValue: CGFloat = 4.0
        static let shapeViewWidthToBoundsWidth: CGFloat = 0.6
        static let shapeViewHeightToBoundsHeight: CGFloat = 0.625
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let shapeViewXOffsetToBoundsWidth: CGFloat = 0.2
        static let shapeViewYOffsetToBoundsHeight: CGFloat = 0.1875
        static let shapeRectHeightToShapesViewHeight: CGFloat = 0.3
        static let spaceInBetweenShapesToShapesViewHeight: CGFloat = 0.05
        static let spaceBeforeAndAfterTwoShapesToShapesViewHeight: CGFloat = 0.175
        static let spaceBeforeAndAfterOneShapeToShapesViewHeight: CGFloat = 0.35
    }
    
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    private var shapeViewOriginXCoordinate: CGFloat {
        return bounds.size.width * SizeRatio.shapeViewXOffsetToBoundsWidth
    }
    private var shapeViewOriginYCoordinate: CGFloat {
        return bounds.size.height * SizeRatio.shapeViewYOffsetToBoundsHeight
    }
    private var shapeViewWidth: CGFloat {
        return bounds.size.width * SizeRatio.shapeViewWidthToBoundsWidth
    }
    private var shapeViewHeight: CGFloat {
        return bounds.size.height * SizeRatio.shapeViewHeightToBoundsHeight
    }
    private var shapeViewFrame: CGRect {
        return CGRect(x: shapeViewOriginXCoordinate, y: shapeViewOriginYCoordinate, width: shapeViewWidth, height: shapeViewHeight)
    }
    
    private var shapeRectHeight: CGFloat {
        return shapeView.frame.height * SizeRatio.shapeRectHeightToShapesViewHeight
    }
    
    private var spaceBetweenShapesHeight: CGFloat {
        return shapeView.frame.height * SizeRatio.spaceInBetweenShapesToShapesViewHeight
    }
    
    private var spaceBeforeAndAfterOneShapeHeight: CGFloat {
        return shapeView.frame.height * SizeRatio.spaceBeforeAndAfterOneShapeToShapesViewHeight
    }
    
    private var spaceBeforeAndAfterTwoShapesHeight: CGFloat {
        return shapeView.frame.height * SizeRatio.spaceBeforeAndAfterTwoShapesToShapesViewHeight
    }
    
    private var firstShapeOfThreeRect: CGRect {
        return CGRect(x: shapeView.frame.origin.x, y: shapeView.frame.origin.y, width: shapeView.frame.width, height: shapeRectHeight)
    }
    
    private var middleShapeRect: CGRect {
        return CGRect(x: shapeView.frame.origin.x, y: shapeView.frame.origin.y + shapeRectHeight + spaceBetweenShapesHeight, width: shapeView.frame.width, height: shapeView.frame.height * SizeRatio.shapeRectHeightToShapesViewHeight)
    }
    
    private var thirdShapeRect: CGRect {
        return CGRect(x: shapeView.frame.origin.x, y: shapeView.frame.origin.y + (2 * shapeRectHeight) + (2 * spaceBetweenShapesHeight), width: shapeView.frame.width, height: shapeView.frame.height * SizeRatio.shapeRectHeightToShapesViewHeight)
    }
    
    private var firstShapeOfTwoRect: CGRect {
        return CGRect(x: shapeView.frame.origin.x, y: shapeView.frame.origin.y + spaceBeforeAndAfterTwoShapesHeight, width: shapeView.frame.width, height: shapeView.frame.height * SizeRatio.shapeRectHeightToShapesViewHeight)
    }
    
    private var secondShapeOfTwoRect: CGRect {
        return CGRect(x: shapeView.frame.origin.x, y: shapeView.frame.origin.y + spaceBeforeAndAfterTwoShapesHeight + shapeRectHeight + spaceBetweenShapesHeight, width: shapeView.frame.width, height: shapeView.frame.height * SizeRatio.shapeRectHeightToShapesViewHeight)
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
        UIGraphicsGetCurrentContext()?.saveGState()
        self.addClip()
        for i in stride(from: 0.0, through: Double(rect.size.width), by: 5.0) {
            self.move(to: CGPoint(x: rect.origin.x + CGFloat(i), y: rect.origin.y))
            self.addLine(to: CGPoint(x: rect.origin.x + CGFloat(i), y: rect.origin.y + rect.size.height))
        }
        self.stroke()
        UIGraphicsGetCurrentContext()?.restoreGState()
    }
    
    func alphaFill() {
        self.fill(with: .normal, alpha: 0.1)
        self.lineWidth = 2.0
        self.stroke()
    }
}
