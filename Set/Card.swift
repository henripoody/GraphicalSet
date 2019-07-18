//
//  Card.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 6/10/18.
//  Copyright © 2018 Mobile Apps Kitchen. All rights reserved.

import Foundation

enum Color {
    case firstColor, secondColor, thirdColor
}

enum Shape {
    case firstSymbol, secondSymbol, thirdSymbol
}

enum Shading {
    case firstShading, secondShading, thirdShading
}

enum Number: Int {
    case One = 1, Two = 2, Three = 3
}


struct Card {    
    var cardID: Int
    let symbol: Shape
    let color: Color
    let shading: Shading
    let numberOfSymbols: Number
}
