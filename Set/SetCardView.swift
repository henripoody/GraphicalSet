//
//  SetCardView.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 1/9/19.
//  Copyright © 2019 Mobile Apps Kitchen. All rights reserved.
//

import UIKit

class SetCardView: UIView {

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
