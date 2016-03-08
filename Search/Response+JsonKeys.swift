//
//  Response+JsonKeys.swift
//  Search
//
//  Created by David Haynes on 08/03/2016.
//  Copyright © 2016 Ordnance Survey. All rights reserved.
//

import Foundation

extension Response {
    // MARK: Declaration for string constants to be used to decode and also serialize.
    @nonobjc internal static let ResultsKey: String = "results"
    @nonobjc internal static let HeaderKey: String = "header"
    @nonobjc internal static let ResultKey: String = "DPA"
}