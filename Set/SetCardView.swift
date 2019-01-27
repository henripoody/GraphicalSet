//
//  SetCardView.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 1/9/19.
//  Copyright © 2019 Mobile Apps Kitchen. All rights reserved.
//

import UIKit

class SetCardView: UIView {

    private lazy var symbolView = createSymbolView()

    private func createSymbolView() -> UIView {
        let view = SymbolView()
        addSubview(view)
        return view
    }
    
    private func configureSymbolsView(_ view: UIView) {
        view.isOpaque = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureSymbolsView(symbolView)
        symbolView.frame = symbolViewFrame
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        UIColor.white.setFill()
        roundedRect.fill()
    }
}

extension SetCardView {
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    private var symbolViewOriginXCoordinate: CGFloat {
        return bounds.size.width * SizeRatio.xOffsetToBoundsWidth
    }
    private var symbolViewOriginYCoordinate: CGFloat {
        return bounds.size.height * SizeRatio.yOffsetToBoundsHeight
    }
    private var symbolViewWidth: CGFloat {
        return bounds.size.width * SizeRatio.symbolViewWidthToBoundsWidth
    }
    private var symbolViewHeight: CGFloat {
        return bounds.size.height * SizeRatio.symbolViewHeightToBoundsHeight
    }
    private var symbolViewFrame: CGRect {
       return CGRect(x: symbolViewOriginXCoordinate, y: symbolViewOriginYCoordinate, width: symbolViewWidth, height: symbolViewHeight)
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
