//
//  Card.swift
//  Set
//
//  Created by Nada Yehia Dawoud on 6/10/18.
//  Copyright © 2018 Mobile Apps Kitchen. All rights reserved.

import Foundation

enum Color {
    case green, purple, pink
    
    static let all = [green, purple, pink]
}

enum Shape {
    case diamond, squiggle, oval
    
    static let all = [diamond, squiggle, oval]
}

enum Shading {
    case stroked, filled, striped
    
    static let all = [stroked, filled, striped]
}

enum Number: Int {
    case one = 1, two = 2, three = 3
    
    static let all = [one, two, three]
}


struct Card: Equatable {
    var cardID: Int
    let symbol: Shape
    let color: Color
    let shading: Shading
    let numberOfSymbols: Number
}
