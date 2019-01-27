//
//  SymbolView.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 1/17/19.
//  Copyright © 2019 Mobile Apps Kitchen. All rights reserved.
//

import UIKit

class SymbolView: UIView {

    override func draw(_ rect: CGRect) {
//        let firstSymbolPath = UIBezierPath(rect: firstSymbolOfThreeRect)
//        UIColor.yellow.setFill()
//        firstSymbolPath.fill()
//
//        let secondSymbolPath = UIBezierPath(rect: middleSymbolRect)
//        UIColor.green.setFill()
//        secondSymbolPath.fill()
//
//        let thirdSymbolPath = UIBezierPath(rect: thirdSymbolRect)
//        UIColor.red.setFill()
//        thirdSymbolPath.fill()
        
        let firstDiamondPath = UIBezierPath()
        firstDiamondPath.move(to: CGPoint(x: firstSymbolOfThreeRect.midX, y: firstSymbolOfThreeRect.minY))
        firstDiamondPath.addLine(to: CGPoint(x: firstSymbolOfThreeRect.maxX, y: firstSymbolOfThreeRect.midY))
        firstDiamondPath.addLine(to: CGPoint(x: firstSymbolOfThreeRect.midX, y: firstSymbolOfThreeRect.maxY))
        firstDiamondPath.addLine(to: CGPoint(x: firstSymbolOfThreeRect.minX, y: firstSymbolOfThreeRect.midY))
        firstDiamondPath.close()

        UIColor.green.setFill()
        firstDiamondPath.fill()
        
        let secondDiamondPath = UIBezierPath()
        secondDiamondPath.move(to: CGPoint(x: middleSymbolRect.midX, y: middleSymbolRect.minY))
        secondDiamondPath.addLine(to: CGPoint(x: middleSymbolRect.maxX, y: middleSymbolRect.midY))
        secondDiamondPath.addLine(to: CGPoint(x: middleSymbolRect.midX, y: middleSymbolRect.maxY))
        secondDiamondPath.addLine(to: CGPoint(x: middleSymbolRect.minX, y: middleSymbolRect.midY))
        secondDiamondPath.close()
        
        UIColor.green.setFill()
        secondDiamondPath.fill()
        
        let thirdDiamondPath = UIBezierPath()
        thirdDiamondPath.move(to: CGPoint(x: thirdSymbolRect.midX, y: thirdSymbolRect.minY))
        thirdDiamondPath.addLine(to: CGPoint(x: thirdSymbolRect.maxX, y: thirdSymbolRect.midY))
        thirdDiamondPath.addLine(to: CGPoint(x: thirdSymbolRect.midX, y: thirdSymbolRect.maxY))
        thirdDiamondPath.addLine(to: CGPoint(x: thirdSymbolRect.minX, y: thirdSymbolRect.midY))
        thirdDiamondPath.close()
        
        UIColor.green.setFill()
        thirdDiamondPath.fill()

    }

}

struct SizeRatio {
    static let symbolViewWidthToBoundsWidth: CGFloat = 0.6
    static let symbolViewHeightToBoundsHeight: CGFloat = 0.625
    static let cornerRadiusToBoundsHeight: CGFloat = 0.06
    static let xOffsetToBoundsWidth: CGFloat = 0.2
    static let yOffsetToBoundsHeight: CGFloat = 0.1875
    static let symbolRectHeightToSymbolsViewHeight: CGFloat = 0.3
    static let spaceInBetweenSymbolsToSymbolsViewHeight: CGFloat = 0.05
    static let spaceBeforeAndAfterTwoSymbolsToSymbolsViewHeight: CGFloat = 0.175
    static let spaceBeforeAndAfterOneSymbolToSymbolsViewHeight: CGFloat = 0.35
    
}

extension SymbolView {
    private var symbolRectHeight: CGFloat {
        return bounds.height * SizeRatio.symbolRectHeightToSymbolsViewHeight
    }
    private var spaceBetweenSymbolsHeight: CGFloat {
        return bounds.height * SizeRatio.spaceInBetweenSymbolsToSymbolsViewHeight
    }
    private var spaceBeforeAndAfterOneSymbolHeight: CGFloat {
        return bounds.height * SizeRatio.spaceBeforeAndAfterOneSymbolToSymbolsViewHeight
    }
    private var spaceBeforeAndAfterTwoSymbolsHeight: CGFloat {
        return bounds.height * SizeRatio.spaceBeforeAndAfterTwoSymbolsToSymbolsViewHeight
    }
    private var firstSymbolOfThreeRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: symbolRectHeight)
    }
    private var middleSymbolRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y + symbolRectHeight + spaceBetweenSymbolsHeight, width: bounds.width, height: bounds.height * SizeRatio.symbolRectHeightToSymbolsViewHeight)
    }
    private var thirdSymbolRect: CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y + (2 * symbolRectHeight) + (2 * spaceBetweenSymbolsHeight), width: bounds.width, height: bounds.height * SizeRatio.symbolRectHeightToSymbolsViewHeight)
    }
    
}

