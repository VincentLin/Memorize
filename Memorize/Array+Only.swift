//
//  Array+Only.swift
//  Memorize
//
//  Created by Vincent Lin on 01/13/2021.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
