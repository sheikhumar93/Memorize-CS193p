//
//  Array+Only.swift
//  Memorize
//
//  Created by Muhammad Umar on 7/8/20.
//  Copyright © 2020 Muhammad Umar. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
