//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Muhammad Umar on 7/1/20.
//  Copyright © 2020 Muhammad Umar. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
