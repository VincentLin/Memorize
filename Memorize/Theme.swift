//
//  Theme.swift
//  Memorize
//
//  Created by Vincent Lin on 01/13/2021.
//

import SwiftUI

struct Theme {
    var name:String
    var emojis:[String]
    var number:Int?
    var color:Color
    
    static let halloween = Theme(name: "Halloween", emojis: ["👻","🎃","🕷","💀","🍬","🕸","🧟‍♂️","🕯"], color: .orange)
    static let animals = Theme(name: "Animals", emojis: ["🐶","🐱","🐹","🐰","🐻","🐼","🐨","🐷"], color: .yellow)
    static let vegetables = Theme(name: "Vegetables", emojis: ["🌽","🍅","🍆","🥕","🥬","🥦","🧅","🥒"], color: .green)
    static let sports = Theme(name: "Sports", emojis: ["🏸","🎾","🏐","🏀","⚾️","🎱","⚽️","🏈"], color: .blue)
    static let faces = Theme(name: "Faces", emojis: ["😵","😅","😴","😍","😛","🥸","😭","😤"], color: .red)
    static let foods = Theme(name: "Foods", emojis: ["🥗","🍱","🍜","🌯","🥙","🌭","🍔","🍕"], color: .purple)
    
    static var themes = [halloween, animals, vegetables, sports, faces, foods]
    
}
