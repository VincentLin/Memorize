//
//  Array+Identifible.swift
//  Memorize
//
//  Created by Vincent Lin on 2021/1/6.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id{
                return index
            }
        }
        
        return nil
    }
}
