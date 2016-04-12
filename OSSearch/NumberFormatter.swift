//
//  NumberFormatter.swift
//  Search
//
//  Created by Dave Hardiman on 11/04/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

struct NumberFormatter {
    private static var formatter: NSNumberFormatter = {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = .NoStyle
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 0
        return numberFormatter
    }()

    static func stringFromNumber(number: Double) -> String? {
        return formatter.stringFromNumber(number)
    }
}
