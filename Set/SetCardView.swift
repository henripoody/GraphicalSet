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
        let view = ShapeView()
        addSubview(view)
        return view
    }
    
    private func configureShapesView(_ view: UIView) {
        view.isOpaque = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureShapesView(shapeView)
        shapeView.frame = shapeViewFrame
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        UIColor.white.setFill()
        roundedRect.fill()
    }
}

extension SetCardView {
    private var cornerRadius: CGFloat {
        return bounds.size.height * ShapeView.SizeRatio.cornerRadiusToBoundsHeight
    }
    private var shapeViewOriginXCoordinate: CGFloat {
        return bounds.size.width * ShapeView.SizeRatio.xOffsetToBoundsWidth
    }
    private var shapeViewOriginYCoordinate: CGFloat {
        return bounds.size.height * ShapeView.SizeRatio.yOffsetToBoundsHeight
    }
    private var shapeViewWidth: CGFloat {
        return bounds.size.width * ShapeView.SizeRatio.shapeViewWidthToBoundsWidth
    }
    private var shapeViewHeight: CGFloat {
        return bounds.size.height * ShapeView.SizeRatio.shapeViewHeightToBoundsHeight
    }
    private var shapeViewFrame: CGRect {
       return CGRect(x: shapeViewOriginXCoordinate, y: shapeViewOriginYCoordinate, width: shapeViewWidth, height: shapeViewHeight)
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
